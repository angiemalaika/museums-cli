require "museums/cli/version"
require 'open-uri'
require 'nokogiri'
require "museums/cli/version"
require 'pry'

def run
  puts "Welcome to the Smithsonian"
  puts "Here is a menu of our Musuems, Galleries and Zoo"
  puts "---------------------------------------------------"
  
  html = open("https://www.si.edu/museums")
  doc = Nokogiri::HTML(html)
  
  doc.css(".title.h3").each do |attraction|
  title = attraction.text.strip
  binding.pry 
  end 
end

# module Museums
#   module Cli
#     class Error < StandardError; end
#     # Your code goes here...
#   end
# end