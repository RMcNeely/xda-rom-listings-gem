require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  attr_accessor :projects_list

  def self.fresh_scrape
    scraped_url = "http://forum.xda-developers.com/lg-g3/development"
    scraped = Nokogiri::HTML(open(scraped_url))

    @projects_list = []
    #    scraped.css(".thread-info-cell").each do |entry|
    scraped.css(".thread-info-cell").each do |entry|
      @projects_list <<{
      :project_name => entry.css(".threadTitle").text,
      :thread_link => entry.css(".thread-title-cell a").attribute("href").value,
      :developer => entry.css(" .smallfont a").text
    }
    end
    @projects_list
#binding.pry
  end

  def self.projects_list
    @projects_list
  end
end

#project_name = {}
#project_name = entry.css(".devdb-tag + .threadTitle").text
