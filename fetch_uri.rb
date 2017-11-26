require 'httparty'
require 'nokogiri'
require 'uri'

class FetchUri
  def initialize(uri)
    @uri = uri
  end
  def proxy
    proxy_array = [
      'line1.lichchieu.vn:3800',
      'line2.lichchieu.vn:3800',
      'line3.lichchieu.vn:3800'
    ]
    rd =(rand() * proxy_array.size).to_i
    proxy_ = proxy_array[rd].split(":")
    @proxy_host = proxy_[0].to_s
    @proxy_port = proxy_[1].to_i
  end
  def user_agent
    user_agent_array =[
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36',
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36',
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.91 Safari/537.36',
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36 OPR/49.0.2725.34',
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36',
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/54.2.131 Chrome/48.2.2564.131 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/56.3.120 Chrome/50.3.2661.120 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/64.4.130 Chrome/58.4.3029.130 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/55.2.126 Chrome/49.2.2623.126 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/56.3.120 Chrome/50.3.2661.120 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/58.3.134 Chrome/52.3.2743.134 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/58.3.136 Chrome/52.3.2743.136 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.1.3029.81 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.3.3029.81 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.8.3029.81 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.6.2840.71 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0; Firefox 52.4.0 - 111442-1701220098-1.45',
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0; Firefox 52.4.0 - 111442-1800920044-1.45',
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0; Firefox 52.5.0 - 111442-1800920044-1.46',
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0; Firefox 52.5.0 - 111512-1800920044-1.46',
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0',
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:55.0) Gecko/20100101 Firefox/55.0',
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:56.0) Gecko/20100101 Firefox/56.0',
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:57.0) Gecko/20100101 Firefox/57.0',
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:58.0) Gecko/20100101 Firefox/58.0',
    ]
    ua =(rand() * user_agent_array.size).to_i
    @user_agent = user_agent_array[ua]
  end
  def doc
    user_agent
    proxy
    puts @proxy_host
    begin
      apicall = HTTParty.get(
        @uri,
        http_proxyaddr: @proxy_host,
        http_proxyport: @proxy_port,
        headers: {"User-Agent" => @user_agent},
        timeout: 30
      )
      @doc ||= Nokogiri::HTML apicall.parsed_response
    rescue Net::OpenTimeout
      apicall = HTTParty.get(
        @uri,
        headers: {"User-Agent" => @user_agent},
        timeout: 30
      )
      @doc ||= Nokogiri::HTML apicall.parsed_response
    rescue => e 
      puts e
    end
  end
end
class FetchUriPost < FetchUri
  def initialize(uri,data)
    super(uri)
    @data =data
  end
  def doc
    user_agent
    proxy
    begin
      apicall = HTTParty.post(
        @uri,
        body: "topic[]:83",
        http_proxyaddr: @proxy_host,
        http_proxyport: @proxy_port,
        headers: {"User-Agent" => @user_agent,"Content-Type" => "application/x-www-form-urlencoded; charset=UTF-8"},
        timeout: 30
      )
      @doc ||= Nokogiri::HTML apicall.parsed_response
    rescue Net::OpenTimeout
      apicall = HTTParty.post(
        @uri,
        body: "topic[]=83",
        headers: {"User-Agent" => @user_agent,"Content-Type" => "application/x-www-form-urlencoded; charset=UTF-8"},
        timeout: 30
      )
      @doc ||= Nokogiri::HTML apicall.parsed_response
    rescue => e 
      puts e
    end
  end
end
#u ='https://www.engvid.com/english-lessons'
#puts FetchUri.new(u).doc