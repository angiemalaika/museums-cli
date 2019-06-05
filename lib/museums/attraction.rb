class Attraction 
  attr_accessor :name 
  @@all = []
  def initialize(name)
    @name = name 
    # @@all << self 
  end 
  
  def self.all
    @@all
  end 
  
  def self.save
    @@all << self 
  end 
end 