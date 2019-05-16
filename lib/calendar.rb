require 'google/apis/calendar_v3'
require 'googleauth'

module MeetupSync
  class Calendar
    attr_accessor :calendar_id
    attr_accessor :events
    attr_accessor :service

    def initialize(calendar_id)
      @calendar_id = calendar_id
    end

    def events
      @events ||= retrieve_events
    end

    def service
      @service ||= begin
        # This requires:
        #
        # ENV["GOOGLE_CLIENT_ID"]
        # ENV["GOOGLE_CLIENT_EMAIL"]
        # ENV["GOOGLE_ACCOUNT_TYPE"]
        # ENV["GOOGLE_PRIVATE_KEY"]
        #
        scope = Google::Apis::CalendarV3::AUTH_CALENDAR
        authorizer = ::Google::Auth::ServiceAccountCredentials.make_creds(scope: scope)
        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = authorizer
        service
      end
    end

    def event_ids
      events.items.map { |e| Digest::MD5.hexdigest("#{e.summary}-#{e.start.date_time}") }
    end

    def save_calendar_event!(event)
      service.insert_event(calendar_id, event)
    end

    private

    def retrieve_events
      service.list_events(calendar_id,
                          single_events: true,
                          order_by: 'startTime',
                          time_min: DateTime.now.rfc3339)

    end
  end
end
