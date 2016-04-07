require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  attr_accessor :projects_list

  def self.fresh_scrape
    scraped_url = "http://forum.xda-developers.com/lg-g3/development"
    scraped = Nokogiri::HTML(open(scraped_url))

    @projects_list = []
    #scraped.css("div #tab_romList").each do |div|
    scraped.css(".thread-title-cell").each do |entry|
      @projects_list << entry.css(".devdb-tag + .threadTitle").text
    end
    @projects_list.delete_if {|thread| thread == ""}
#binding.pry
  end

  def self.projects_list
    @projects_list
  end
end
