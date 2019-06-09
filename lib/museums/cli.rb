require "museums/cli/version"
require 'pry'
# require 'open-uri'
# require 'nokogiri'

class CLI

  def run

    puts "Welcome to the Smithsonian Museums, Galleries and Zoo."
    puts "Here is a menu of our exhibits and attractions:"
    puts "---------------------------------------------------"
    puts "Please type 'exit' to exit this app."

      Scraper.scrape_attractions
      Scraper.scrape_locations
      self.display_attractions
      #self.display_location
      # Scraper.attraction_location
      menu
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
  else
       puts "Invalid selection!"
       menu
        # self.display_locations
        end
      end

end


    #attractions = []
    #   html = open ("https://www.si.edu/museums")
  #   doc = Nokogiri::HTML(html)

  #   doc.css(".title.h3").each do |attraction|
  #   name = attraction.text.strip
  #   Attraction.new(name)

  #   # binding.pry
  # end


  # puts "Please type a number to view the museums location"
  # puts "To quit, type 'exit'."
      # input = ""
    # input = gets.strip
   # if  input != "exit"
