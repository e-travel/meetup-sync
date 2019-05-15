module MeetupSync
  class Venue
    attr_accessor :name,
                  :latitude,
                  :longitude,
                  :address,
                  :city,
                  :country

    def initialize(name, latitude, longitude, address, city, country)
      self.name = name
      self.latitude = latitude
      self.longitude = longitude
      self.address = address
      self.city = city
      self.country = country
    end
  end
end