require "museums/cli/version"
require 'pry'
require 'open-uri'
require 'nokogiri'

class CLI
  def run
     attractions = []
    
    puts "Welcome to the Smithsonian Museums, Galleries and Zoo."
    puts "Here is a menu of our exhibits and attractions:"
    puts "---------------------------------------------------"
    
    html = open ("https://www.si.edu/museums")
    doc = Nokogiri::HTML(html)
    
    doc.css(".title.h3").each do |attraction|
    name = attraction.text.strip
     #Attraction.new(name)
    # binding.pry
    attractions << name 
  end 
  #   Scraper.scrape_attractions
  #   display_attractions
  # end 
    
  # def display_attractions
      attractions.each.with_index(1) do |name,i|
      puts "#{i}. #{name}"
      end 
   end 
end