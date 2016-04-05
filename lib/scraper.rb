require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  def self.fresh_scrape
    scraped_url = "http://forum.xda-developers.com/lg-g3/development#romList"
    scraped = Nokogiri::HTML(open(scraped_url))

    rom_list = []
    scraped.css("div #tab_romList")

binding.pry
  end

end
