#require 'open-uri'
#require_relative '../config/environment'
#require 'pry'
#require 'nokogiri'
class Dry_run::Scraper

  def scrape_podcast_page #grabs the overall page of podcasts
      Nokogiri::HTML(open('http://www.partiallyexaminedlife.com/category/podcast-episodes/?order=ASC'))
    end

  def scrape_podcast_index #grabs the names of the podcasts
    podray = []
    self.scrape_podcast_page.xpath("//article/header[@class='entry-header']/h2[@class='entry-title']").each_with_index do |pod,i| podray << "#{i}, #{pod.text}"
  end
  podray
end
end

  def select_podcast(input) #reading wrongly as private
  self.scrape_podcast_index[input]
end

  def order #removes non-free episodes, makes a list of free episodes
    counter = 0
    self.scrape_podcast_index.each do |ti|
    counter += 1
    if ti.text.include? "PREVIEW" then nil
    elsif ti.text.include? "Citizens Only" then nil
    elsif ti.text.include? "Citizen Edition" then nil
    else puts "#{counter}: #{ti.text.class}"
    end
  end
end

  def get_tags #gets tags from inside article class, doesn't support more than one word tags yet because i'm bad at regex
    #produces nested array
        self.scrape_podcast_page.xpath("//article").each do |tag_set| #scrapes website for every podcast
      puts "#{tag_set.to_s.scan(/(tag-)(\w+)/)} " #puts all the tags for each
      #could/should make this into each_with_index
    end
  end

  def scrape_related_tags(input) #scrapes tags based on input ie. 'nietzsche'
    self.scrape_podcast_page.xpath("//header[@class='entry-header']/h2[@class='entry-title']/a/../../..").each do |node|
    if "#{node.attribute('class')}".include?(input) then puts "#{node.attribute('class')}"
    end
  end
end

  def create_podcast

end

binding.pry
#find tags - attr('class').value
#regex for tags in strings? (tag-)(\w+) (only supports one word tags)
