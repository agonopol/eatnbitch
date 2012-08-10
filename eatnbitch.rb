require 'sequel'
require 'yaml'
require 'logger'
require 'net/http'
require 'uri'
require 'rest_client'
require 'nokogiri'
require 'date'

module EatNBitch
  ROOT = File.expand_path(File.join(File.dirname(__FILE__)))
  LOG = Logger.new(STDOUT)
  config = YAML.load_file(File.join(ROOT, 'config', 'db.yml'))
  DB = Sequel.connect(config[ENV['RACK_ENV'] || 'development'])
  DB.loggers << LOG
  Sequel::MySQL.default_charset = 'utf8'
end

require File.join(EatNBitch::ROOT, 'lib', 'core_extensions')
require File.join(EatNBitch::ROOT, 'lib', 'user')
require File.join(EatNBitch::ROOT, 'lib', 'dish')
require File.join(EatNBitch::ROOT, 'lib', 'review')
require File.join(EatNBitch::ROOT, 'lib', 'restaurant')



