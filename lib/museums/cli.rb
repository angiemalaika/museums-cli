require "museums/cli/version"
require 'pry'

# require 'open-uri'
# require 'nokogiri'

class CLI


  def run

      Scraper.scrape_attractions
      Scraper.scrape_locations
      self.welcome
      self.list_attractions
      self.user_selection
      menu
      goodbye

    end

    def menu
      input = nil
      input = gets.strip.to_i
      attraction = Attraction.find_by_index(input)
      if  !attraction
        self.user_selection
      elsif attraction
          self.list_location(attraction)
    end
  end

    def welcome
     puts "Welcome to the Smithsonian Museums, Galleries and Zoo."
    end

    def list_attractions
      puts "Here is a menu of our exhibits and attractions:"
      puts "---------------------------------------------------"
      Attraction.all.each.with_index(1){|exhibit,i| puts "#{i}. #{exhibit.name}"}
    end

    def user_selection
    puts "Please enter the number of the attraction location you would like to view or type exit to exit:"
    end

    def list_location(attraction)
      puts "#{attraction.location}"
    end

    def goodbye

      puts "Thank you, hope to see you at one of our locations soon!!!"
    end
end
