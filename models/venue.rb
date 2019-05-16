module MeetupSync
  class Venue
    attr_accessor :name
    attr_accessor :latitude
    attr_accessor :longitude
    attr_accessor :address
    attr_accessor :city
    attr_accessor :country

    def initialize(name, latitude, longitude, address, city, country)
      self.name = name
      self.latitude = latitude
      self.longitude = longitude
      self.address = address
      self.city = city
      self.country = country
    end

    def full_location
      "#{name}, #{address}, #{city}"
    end
  end
end