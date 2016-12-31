require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def scrape_podcast_page
      Nokogiri::HTML(open('http://www.partiallyexaminedlife.com/category/podcast-episodes/?order=ASC'))
    end

  def scrape_podcast_index
    self.scrape_podcast_page.xpath("//article/header[@class='entry-header']/h2[@class='entry-title']")
  end

  def order
    counter = 0
    self.scrape_podcast_index.each do |ti|
    counter += 1
    if ti.text.include? "PREVIEW" then nil
    elsif ti.text.include? "Citizens Only" then nil
    elsif ti.text.include? "Citizen Edition" then nil
    else puts "#{counter}: #{ti.text}"
    end
  end
end

end
  binding.pry
