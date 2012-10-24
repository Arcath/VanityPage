# Vanity Page

# Ruby Gems & Bundler
require "rubygems"
require "bundler/setup"

# Gems
require 'sinatra'
#require 'yaml'

# Internal Requries
require './lib/vanity_page'           # Main Module

get '*' do |path|
  @template = VanityPage::Template.new(request.path_info, VanityPage::Router.new)
  @format, @file = @template.yield
  halt 404 if @file == @template.router.error["404"]
  content_type @template.content_type
  erb @template.application
end

not_found do
  @template = VanityPage::Template.new(request.path_info, VanityPage::Router.new)
  @format, @file = @template.yield
  erb @template.application
end

