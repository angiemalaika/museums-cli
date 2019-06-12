# require 'open-uri'
# require 'nokogiri'

class Scraper

  ATTRACTION_URL = ("https://www.si.edu/museums")
  #website that we scraping
    #constant does not need to be changed

  def self.scrape_attractions
    html = open(ATTRACTION_URL)
    doc = Nokogiri::HTML(html)
    elements = doc.css(".inner")
    elements.shift #access the second div.inner class that holds museum information
    elements.each do |attraction|
      name = attraction.css(".title").text.strip
      location = attraction.css(".location").text.gsub("  ", "").gsub("See on Map", "").gsub("\n","")
      Attraction.new(name,location)
      end
    end
  end
