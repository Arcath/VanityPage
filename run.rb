# Vanity Page

# Ruby Gems & Bundler
require "rubygems"
require "bundler/setup"

# Gems
require 'sinatra'
require 'yaml'

# Internal Requries
require 'lib/vanity_page'           # Main Module
require 'lib/vanity_page/config'    # Config Class

get '*' do |path|
    template, @config = VanityPage.generate(path)
    erb template
end
