require 'open-uri'
require 'nokogiri'

class Scraper

  ATTRACTION_URL = ("https://www.si.edu/museums")
  #website that we scraping
    #constant does not need to be changed

  def self.scrape_attractions
    html = open(ATTRACTION_URL)
    doc = Nokogiri::HTML(html)
    #create variable uses nokogiri

    doc.css(".title").each do |attraction|
    name = attraction.text.strip
    Attraction.new(name,Scraper.scrape_locations)
      end
    end

    def self.scrape_locations

    html = open(ATTRACTION_URL)
    doc = Nokogiri::HTML(html)
    doc.css(".location").collect do|loc|
    location = loc.text.split(' ')[0...-3].join(' ')
    location.gsub("See on Map", "")


    end
  end

end


#this scrapes/collects out exhibit names
#text.gsub("  ", "").gsub("See on Map", "").gsub("\n","")
# doc.css(".location").each do|where|
# location = where.text.split(' ')[0...-3].join(' ')
# location.gsub("See on Map", "")
  #add location method
  #Attraction.new(name,location)
