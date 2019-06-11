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
      self.list_attractions
      #implicit self
      #self.display_location
      # Scraper.attraction_location
      menu
      goodbye

    end

    def list_attractions
      Attraction.all.each.with_index(1){|exhibit,i| puts "#{i}. #{exhibit.name}"}
    end

    def list_locations
      Attraction.all.each.with_index(1) do |x,i|
        puts "#{i}. #{x.location}"
      end
    end

    def menu
      input = nil
      while input != "exit"
        puts "Please enter the number of the exhibit location you would like to view:"
        input = gets.strip.downcase

         if input.to_i > 0
           puts @list_locations[input.to_i-1]
         elsif input == "list"
           self.display_attractions
        # case input
        #   when "1"
        #     puts "The African American Museum exhibit is located at:"
        #   when "2"
        #     puts "That African Art Museum exhibit is located at:"
          else
            puts "Invalid input, please type a number between 1 - 23 or exit:"
          end
      end
    end

    def goodbye
      puts "Thank you, hope to see you at one of our locations soon!!!"
    end
end
#    def menu
#
#     puts "Please type 'list' to view all locations:"
#     input = " "
#     input = gets.strip.downcase
#   if input == "list"
#     self.display_locations
#   elsif
#      input != "list"
#       puts "Invalid input! please enter a valid input to view the list."
#
#         # self.display_locations
#         end
#       end
# end

# end
