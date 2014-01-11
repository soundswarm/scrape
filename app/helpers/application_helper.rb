module ApplicationHelper

  # open-uri is part of the standard library and allows you to download a webpage
  require 'open-uri'

  def scrape
    url = "http://www.drumwolf.com"
    data = Nokogiri::HTML(open(url))
	data.css("li")[1]
  end

end
