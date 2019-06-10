require "museums/cli/version"
require 'pry'

# require 'open-uri'
# require 'nokogiri'

class CLI


  def run

    puts "Welcome to the Smithsonian Museums, Galleries and Zoo."
    puts "Here is a menu of our exhibits and attractions:"
    puts "---------------------------------------------------"
      Scraper.scrape_attractions
      Scraper.scrape_locations
      self.display_attractions
      #implicit self
      #self.display_location
      # Scraper.attraction_location
      menu
  #     puts "Please type 'list' to view all locations:"
  #     input = " "
  #     input = gets.chomp.downcase
  #
  #   if input == "list"
  #     self.display_locations
  #   else
  #     puts "Invalid input!"
  #     menu
  # end
end

  def display_attractions
      Attraction.all.each.with_index(1) do |exhibit,i|
      puts "#{i}. #{exhibit.name}"
      end
  end

  def display_locations

    Attraction.all.each.with_index(1) do |x,i|
      puts "#{i}. #{x.location}"

    end
  end
   def menu

    puts "Please type 'list' to view all locations:"
    input = " "
    input = gets.chomp.downcase

  if input == "list"
    self.display_locations
  elsif
     input != "list"
      puts "Invalid input!"

        # self.display_locations
        end
      end
end
