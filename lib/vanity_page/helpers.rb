module VanityPage
  module Helpers
    def self.article(file)
      path = "/articles/#{file.gsub(/\.html\.erb/,'')}"
      body = File.open("views/articles/#{file}").read
      output = "<div class=\"well\"><p class=\"lead\"><a href=\"#{path}\">#{body.scan(/<h1>(.*?)<\/h1>/).first.first}</a></p>
      <p>#{body.scan(/<p>(.*?)<\/p>/).first.first}</p></div>"
      return output unless body =~ /^<!-- OLD -->/
    end
    
    def self.tumblings
      output = ""
      begin
        Timeout::timeout(5){
          feed = Feedzirra::Feed.fetch_and_parse("http://tumblr.arcath.net/rss")
          feed.entries[0..5].each do |entry|
            output += "<div class=\"well tumbling\"><p class=\"lead\"><a href=\"#{entry.url}\" target=\"_BLANK\">#{entry.title}</a></p><p>#{entry.summary}</p></div>"
          end
        }
      rescue Timeout::Error
        output = "Tumblr Timed Out"
      end
      return output
    end
  end
end