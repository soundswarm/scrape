module ApplicationHelper

  # open-uri is part of the standard library and allows you to download a webpage
  require 'open-uri'

  def scrape
    url = "http://www.drumwolf.com"
    data = Nokogiri::HTML(open(url))
	li_data = data.css("li")
	li_data.map { |item| "#{item} <p>" }.join("").html_safe
  end

  def get_hartl_chapters
  	url = "http://ruby.railstutorial.org/ruby-on-rails-tutorial-book"
    data = Nokogiri::HTML(open(url))
	link_data = data.css("li.chapter > a")
	link_data.map { |item| item.attr('href') }
  end

end
