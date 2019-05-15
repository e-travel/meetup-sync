module MeetupSync
  class Event
    attr_accessor :name
    attr_accessor :local_date
    attr_accessor :local_time
    attr_accessor :link
    attr_accessor :description
    attr_accessor :venue

    def initialize(name, local_date, local_time, link, description, venue)
      self.name = name
      self.local_date = local_date
      self.local_time = local_time
      self.link = link
      self.description = description
      self.venue = venue
    end
  end
end