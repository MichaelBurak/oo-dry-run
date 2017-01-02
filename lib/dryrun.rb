module Dry_run
end

#require_relative '../config/environment'
require 'open-uri'
require 'pry'
require 'nokogiri'
#require_relative 'scraper'
require 'bundler'

Bundler.require

require_all 'lib'
