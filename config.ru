require 'rubygems'
require 'sinatra'

require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'server'))
run Sinatra::Application