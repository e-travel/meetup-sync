require 'json'
require 'rest-client'

require_relative '../lib/log'

require_relative '../models/event'
require_relative '../models/venue'

module MeetupSync
  class Sync
    def self.handler(event:, context:)
      meetup_url = 'https://api.meetup.com/find/upcoming_events'
      params = {
        key: ENV['MEETUP_API_KEY'],
        lat: 37.975342,
        lon: 23.736151,
        radius: 15.0,
        topic_category: 292
      }

      response = RestClient.get(meetup_url, { params: params })

      events = []

      JSON.parse(response)['events'].each do |event|
        venue = Venue.new(event["venue"]["name"], 
                          event["venue"]["lat"], 
                          event["venue"]["lon"], 
                          event["venue"]["address_1"], 
                          event["venue"]["city"], 
                          event["venue"]["country"]) if event["venue"]
        events << Event.new(event["name"], event["local_date"], event["local_time"], event["link"], event["description"], venue)
      end

      Log.info("Events found: #{events.size}")
    end
  end
end
