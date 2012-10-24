module VanityPage
	class Router
		attr_reader :root, :error
		def initialize
			@root = "views/index/index.html.erb"
      @error = {"404" => "views/error/404.html.erb"}
		end 
    
    def file_path(path)
      if path == "/"
        return @root
      else
        folder, file = path.split("/")[1..2]
        file ||= "index"
        file.gsub!(/\..*?$/,'')
        folder.gsub!(/\..*?$/,'')
        format = path =~ /\./ ? path.split(".").last  : "html"
        if File.exists?("views/#{folder}/#{file}.#{format}.erb")
          return "views/#{folder}/#{file}.#{format}.erb"
        else
          return @error["404"]
        end
      end
    end
	end
end