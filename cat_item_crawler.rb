require_relative 'fetch_uri'
class Category
  def initialize
    @uri = "https://www.engvid.com/english-lessons"
  end
  def items
    crawler_items
  end
  def crawler_items
    @items_arr =[]
    lesson_topic =FetchUri.new(@uri).doc.css('li.all_cat-item')
    lesson_topic.each do |topic|
      @items_arr << topic['class'].to_s.gsub(/\D/, '').to_i
    end
    puts @items_arr
  end
end
Category.new.crawler_items