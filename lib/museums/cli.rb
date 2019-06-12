# require "museums/cli/version"
# require 'pry'

# require 'open-uri'
# require 'nokogiri'

class CLI


  def run

      Scraper.scrape_attractions
      self.welcome
      self.list_attractions
      menu


    end

    def menu
      input = nil
      while input!= "exit"
        self.user_selection
      input = gets.strip.downcase
      puts""
      attraction = Attraction.find_by_index(input.to_i)

      if input.to_i > 0 && input.to_i <24
          self.list_location(attraction)
        elsif input.downcase == "exit"
          self.goodbye
        else
          self.error_message
      end
    end
  end

    def welcome
    puts " --------------------------------------------------------------"
    puts "|                                                              |"
    puts "| Welcome to the Smithsonian Museums, Galleries and Zoo.       |"
    puts "|                                                              |"
    puts " --------------------------------------------------------------"
    puts ""
    end

    def list_attractions
      puts ""
      puts "Here is a listing of our exhibits and attractions:"
      puts "---------------------------------------------------"
      Attraction.all.each.with_index(1){|exhibit,i| puts "  #{i}.  #{exhibit.name}  "}
    end

    def user_selection
    puts "Please enter the number of the attraction location you would like to view or type exit to exit:"
    end

    def list_location(attraction)
      puts "  Smithsonian Attraction:  #{attraction.name} "
      puts "  Location:  #{attraction.location} "
      puts ""
      puts "-------------------------------------------------------------------"

    end
    def error_message
      puts "invalid selection, please try again:"
    end

    def goodbye
      puts "Thank you, hope to see you at one of our locations soon!!!"
    end
end
