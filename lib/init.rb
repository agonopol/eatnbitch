require 'sinatra'
require 'date'
require 'json'
require 'erb'


require File.expand_path(File.join(File.dirname(__FILE__), "sinatra_reloader"))
require File.expand_path(File.join(File.dirname(__FILE__), "core_extensions"))
require File.expand_path(File.join(File.dirname(__FILE__), "review"))
require File.expand_path(File.join(File.dirname(__FILE__), "users"))

reviews = EatNBitch::Reviews.new
users = EatNBitch::Users.new

reviews.add_review("Kashka is the shit", "xenka penka")
reviews.add_review("Kashka is shit", "sashka kakashka")

users.add_user("Sashka","Kakashka","kakashka@kakshkin.com")
users.add_user("Xenka","Penka","penka@gmail.com")
users.add_user("Laurie","Ramashka","laurie@aol.com")

ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

configure do
  set :public, File.join(ROOT, 'public')
  set :sessions, true
end

get '/reviews' do
	reviews_erb = File.join(ROOT, 'views', 'reviews.erb')
 	ERB.new(File.read(reviews_erb)).result(binding)
end