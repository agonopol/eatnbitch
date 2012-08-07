# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# require "rvm/capistrano"
# set :rvm_ruby_string, 'ruby-1.9.2-preview3'
require 'fileutils'

set :application, "twanalytics"
set :repository,  "git@github.com:twanalytic/twanalytics.git"

set :scm, :git
set :keep_releases, 3
set :user, 'twanalytic'
set :use_sudo, false
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/#{application}"

ssh_options[:forward_agent] = true

role :web, "66.228.37.133"
role :app, "66.228.37.133"
role :db,  "66.228.37.133", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  task :migrations do
    run "cd #{current_path}; rake RACK_ENV=production db:migrate"
  end
  
  task :gems do
    gems = %w[sinatra json mysql mysql2 sqlite3-ruby sequel
      twitter rest-client nokogiri haml omniauth] * ' '
    run "gem i #{gems}"
  end
  
  task :load_latest do
    run "cd #{current_path} && rake RACK_ENV=production db:load_latest"
  end  
end

namespace :db do
  task :prodcopy do
    c = YAML.load_file(File.join(File.dirname(__FILE__), 'db.yml'))
    prod = c['production']
    u, p, db = prod['user'], prod['password'], prod['database']
    there = "#{current_path}/#{db}.sql"
    here = File.join(File.dirname(__FILE__), '..', "#{db}.sql")
    run "mysqldump --opt --user=#{u} --password=#{p} #{db} > #{there}"
    run "gzip -9 #{there}"
    download "#{there}.gz", "#{here}.gz", :via => :scp
    run "rm #{there}.gz"
    puts `gzip -df #{here}.gz`
    dev = c['development']
    puts `mysql -u #{dev['user']} #{dev['database']} < #{here}`
    FileUtils.rm(here)
  end
end

after 'deploy:update', "deploy:cleanup"

before('deploy:update') { run "mv #{current_path}/twanalytics.db #{deploy_to}/" }
after('deploy:update') { run "mv #{deploy_to}/twanalytics.db #{current_path}/" }