# encoding: utf-8

require './lib/hawknee/version'
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "hawknee"
  gem.version = Hawknee::Version::STRING
  gem.homepage = "http://github.com/semahawk/hawknee"
  gem.license = "MIT"
  gem.summary = %Q{Ruby on Rails 3 based forum.}
  gem.description = %Q{Easily implement a forum to your Rails 3 application.}
  gem.email = "szymon.urbas@yahoo.com"
  gem.authors = ["Szymon Urbaś"]
  gem.files = FileList['app/**/*', 'lib/**/*.rb', 'bin/*', '*.rb', 'test/**/*', 'config/**/*', 'public/**/*', 'README.rdoc', 'CHANGELOG.rdoc', 'LICENSE.txt'].to_a
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = Hawknee::Version::STRING

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Hawknee #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
