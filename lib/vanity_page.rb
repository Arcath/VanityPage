module VanityPage
    Aliases = {"/" => :index}
    
    def self.generate(path)
        generate_config unless @config
        return [Aliases[path], @config]
    end
    
    private
    
    def self.generate_config
        @config = Config.new
        yaml = YAML::load(File.open('config/page.yml'))
        @config.name = yaml["name"]
        @config.title = yaml["title"]
        @config.pages = yaml["pages"]
    end
    
    def self.apply_config(s)
        s.gsub(/\{config-name\}/,@config.name)
    end
end