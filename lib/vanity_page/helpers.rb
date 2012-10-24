module VanityPage
  module Helpers
    def self.article(file)
      path = "/articles/#{file.gsub(/\.html\.erb/,'')}"
      body = File.open("views/articles/#{file}").read
      output = "<div class=\"well\"><p class=\"lead\"><a href=\"#{path}\">#{body.scan(/<h1>(.*?)<\/h1>/).first.first}</a></p>
      <p>#{body.scan(/<p>(.*?)<\/p>/).first.first}</p></div>"
      return output unless body =~ /^<!-- OLD -->/
    end
  end
end