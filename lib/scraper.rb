require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def scrape_podcast_page #grabs the overall page of podcasts
      Nokogiri::HTML(open('http://www.partiallyexaminedlife.com/category/podcast-episodes/?order=ASC'))
    end

  def scrape_podcast_index #grabs the names of the podcasts
    self.scrape_podcast_page.xpath("//article/header[@class='entry-header']/h2[@class='entry-title']")
  end

  def order #removes non-free episodes, makes a list of free episodes
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

  def get_tags #gets tags from inside article class, doesn't support more than one word tags
        self.scrape_podcast_page.xpath("//article").each_with_index do |tag_set,i|
      puts "#{i} #{tag_set.to_s.scan(/(tag-)(\w+)/)} "
    end
  end

end
  binding.pry

#find tags - attr('class').value
#regex for tags in strings? (tag-)(\w+)
