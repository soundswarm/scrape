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
    @url_array.each_with_index.map{ |x,i| "<li><a href='#{x}'>Chapter #{i+1}</a></li>" }.join().to_s.html_safe
  end

  def print_hartl_chapter(url)
    url = "http://ruby.railstutorial.org/#{url}"
    data = Nokogiri::HTML(open(url))
    @header = data.css("h1.chapter")
    @links = data.xpath("//div[@id='book']/*[@class='code' or @class='codelisting' or self::h2[not(@class)]]")
    @links.shift
    @links.shift
    @header.to_s.html_safe + @links.to_s.html_safe
  end

end
