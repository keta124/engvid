require_relative "fetch_uri"
class ItemEngvid
  def initialize
    @uri = "https://www.engvid.com/english-lessons"
  end
  def items
    crawler_items
  end
  def crawler_items
    @items_arr =[]
    lessonlinks =FetchUri.new(@uri,{}).doc.css('.lessonlinks_all_row')
    lessonlinks.each do |lesson|
      lesson.at('a')["href"]
      lesson.at('.lessonlinks_all_lessontitle').text
      lesson.css('.lessonlinks_all_category_item').text
      lesson.at('a img')["alt"].to_s.gsub("Profile photo of ", "")
    end
  end
end