class Attraction
  attr_accessor :name,:location
  @@all = []
  def initialize(name,location)
    @name = name
    @location = location
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_index(number)
    number -= 1
    attraction = @@all[number]
  end
end
