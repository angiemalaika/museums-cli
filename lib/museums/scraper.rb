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
    
    # doc.css(".location").each do|x|
    # location = x.text.delete("\n").strip
    # location.split(' ')[0...-3].join(' ')
    # location
    
     Attraction.new(name, "test")
     
   # doc.css(".location").text.delete("\n").strip
    end 
   end 
 end
# doc.css(".location").each do |loc|
#     m_location = loc.text.delete("\n").strip
#       m_location
#       delete("\n").strip
#     [22] pry(Scraper)> doc.css('.location').map(&:text).first.strip
# => "15th St. and Constitution Ave., NW Washington, DC                 \n                          See on Map"

# god.delete("\n").strip.first


# doc.css(".location")[1].text.delete("\n")
# => "                    950 Independence Avenue, SW Washington, DC                                                        See on Map

# pry(Scraper)> doc.css(".location")[1].text.delete("\n").strip
# => "950 Independence Avenue, SW Washington, DC                                    See on Map"