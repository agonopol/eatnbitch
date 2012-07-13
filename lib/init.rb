require 'sinatra'
require 'date'
require 'json'


require File.expand_path(File.join(File.dirname(__FILE__), "sinatra_reloader"))
require File.expand_path(File.join(File.dirname(__FILE__), "core_extensions"))
require File.expand_path(File.join(File.dirname(__FILE__), "review"))

reviews = EatNBitch::Reviews.new

reviews.add_review("Kashka is the shit", "xenka penka")
reviews.add_review("Kashka is shit", "sashka kakashka")


get '/reviews' do
	reviews.show_all
end