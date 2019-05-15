require 'json'

require_relative '../lib/log'

require_relative '../models/event'
require_relative '../models/venue'

module MeetupSync
  class Sync

    # TODO: utilize response by parsing it into events
    # event = Event.new("", "", "", "",
    #                   Venue.new("", "", "", "", "", ""))

    def self.handler(event:, context:)
      Log.info("Function #{self.name} executed successfully!")

      { statusCode: 200, body: JSON.generate("Function #{self.name} executed successfully!") }
    end
  end
end
