require "museums/cli/version"

require "museums/cli/version"
require 'pry'

class CLI
  def run
    # attractions = []
    
    puts "Welcome to the Smithsonian Museums, Galleries and Zoo."
    puts "Here is a menu of our exhibits and attractions:"
    puts "---------------------------------------------------"
    
    Scraper.scrape_attractions
    display_attractions
  end 
    
    
    def display_attractions
      Attraction.all.each.with_index(1) do |name,i|
      puts "#{i}. #{name}"
      end 
    end 
end