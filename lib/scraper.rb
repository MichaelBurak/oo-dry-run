require 'open-uri' #this is a gem that lets you open up a page from the web for nokogiri to examine
require 'pry' #this is a debugging tool
require 'nokogiri' #this is what scrapes the data from the website

class Scraper #creative, huh?

  def scrape_podcast_page #gets the data from the page
      Nokogiri::HTML(open('http://philosophizethis.org/category/episode/'))
    end

  def scrape_podcast_index #uses the CSS(styling) of the page to locate the title section of the podcast
    self.scrape_podcast_page.xpath("//h2[@class='alpha entry-title']")
  end

  def order #puts out the text portion - ie. the title - of the podcast
    self.scrape_podcast_index.each do |ti| puts ti.text
    end
end

end
  binding.pry #allows for mucking about in the code
