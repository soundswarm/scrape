module ApplicationHelper

  # open-uri is part of the standard library and allows you to download a webpage
  require 'open-uri'

  def get_hartl_chapter_links
    url = "http://ruby.railstutorial.org/ruby-on-rails-tutorial-book"
    data = Nokogiri::HTML(open(url))
    @links = data.css("li.chapter > a")
    @link_html = @links.map { |item| item.attr('href') }
  end

  def print_hartl_chapter_links
    @url_array = get_hartl_chapter_links
    @url_array.each_with_index.map{ |x,i| "<a href='#{x}'>Chapter #{i+1}</a><br />" }.join().to_s.html_safe
  end

  def print_ror(url)
    #url = "http://ruby.railstutorial.org/#{url}"
    #data = Nokogiri::HTML(open(url))
    #@links = data.css("#book > .codelisting").to_s.html_safe
  end

  def print_terminal(url)
    url = "http://ruby.railstutorial.org/#{url}"
    data = Nokogiri::HTML(open(url))
    @links = data.css("#book > .code, #book > .codelisting")
    @links.shift.to_s.html_safe
  end
end
