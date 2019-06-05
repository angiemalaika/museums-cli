require 'open-uri'
require 'nokogiri'

class Scraper 
  
  ATTRACTION_URL = ("https://www.si.edu/museums")
    #constant does not need to be changed 
    
  def self.scrape_attractions
    html = open(ATTRACTION_URL)
    doc = Nokogiri::HTML(html)
    
    doc.css(".title.h3").each do |attraction|
    name = attraction.text.strip
     Attraction.new(name)
    # binding.pry
   end 
  end 
end 