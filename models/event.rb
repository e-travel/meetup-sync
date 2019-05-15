module MeetupSync
  class Event
    attr_accessor :name
    attr_accessor :local_date
    attr_accessor :link
    attr_accessor :description
    attr_accessor :venue

    def initialize(name, local_date, link, description, venue)
      self.name = name
      self.name = local_date
      self.link = link
      self.description = description
      self.venue = venue
    end
  end
end