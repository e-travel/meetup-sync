module MeetupSync
  class Event
    attr_accessor :name
    attr_accessor :start_date_time
    attr_accessor :end_date_time
    attr_accessor :link
    attr_accessor :description
    attr_accessor :venue

    def initialize(name, start_date_time, end_date_time, link, description, venue)
      self.name = name
      self.start_date_time = start_date_time
      self.end_date_time = end_date_time
      self.link = link
      self.description = description
      self.venue = venue
    end
  end
end