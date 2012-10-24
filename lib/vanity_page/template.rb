module VanityPage
  class Template
    attr_reader :path, :router, :format
    def initialize(path, router)
      @path = path
      @router = router
      @format = path =~ /\./ ? path.split(".").last  : "html" 
    end
    
    def content_type
      "text/#{@format}"
    end
    
    def yield
      [:erb, @router.file_path(@path)]
    end
    
    def application
      :"application.#{@format}"
    end
  end
end