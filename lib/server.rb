require 'sinatra'
require 'sass'
require 'sass/plugin/rack'
require 'json'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'eatnbitch'))
include EatNBitch
require File.join(ROOT, 'lib', 'web_helpers')

configure do
  set :views, File.join(ROOT, 'views')
  set :public, File.join(ROOT, 'public')
  set :sessions, true
  use Sass::Plugin::Rack
  Sass::Plugin.options[:template_location] = File.join(ROOT, 'views', 'stylesheets')
end

configure :development do
  require File.join(ROOT, 'lib', 'sinatra_reloader')
end

get '/' do
  @dishes = DB[:dishes]
  erb :index
end

