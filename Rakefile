require File.expand_path(File.join(File.dirname(__FILE__), 'eatnbitch'))
include EatNBitch

task :default => 'db:load_latest'

namespace :db do
  task :migrate do
    Sequel.extension :migration
    migrations = File.join(ROOT, 'config', 'migrations')
    if version = ENV['VERSION']
      Sequel::Migrator.run(DB, migrations, :target => version.to_i)
    else
      puts migrations
      Sequel::Migrator.run(DB, migrations)
    end
  end
end