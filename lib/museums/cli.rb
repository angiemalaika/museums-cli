require "museums/cli/version"
require 'open-uri'
require 'nokogiri'
require "museums/cli/version"
require 'pry'

class CLI
  def run
    # attractions = []
    
    puts "Welcome to the Smithsonian"
    puts "Here is a menu of our Musuems, Galleries and Zoo"
    puts "---------------------------------------------------"
    
    html = open("https://www.si.edu/museums")
    doc = Nokogiri::HTML(html)
    
    doc.css(".title.h3").each do |attraction|
    name = attraction.text.strip
    Attraction.new(name)
    # attractions << name 
      end 
    Attraction.all.each.with_index(1) do |name,i|
      puts "#{i}. #{name}"
  
      end 
  end
end