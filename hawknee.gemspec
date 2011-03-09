# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hawknee}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Szymon Urbaś"]
  s.date = %q{2011-03-09}
  s.default_executable = %q{hawknee}
  s.description = %q{Easily implement a forum to your Rails 3 application.}
  s.email = %q{szymon.urbas@yahoo.com}
  s.executables = ["hawknee"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG.rdoc",
    "LICENSE.txt",
    "README.rdoc",
    "app/controllers/hawknee/application_controller.rb",
    "app/controllers/hawknee/main_controller.rb",
    "app/views/hawknee/main/index.html.haml",
    "bin/hawknee",
    "config/routes.rb",
    "init.rb",
    "lib/generators/hawknee/install/install_generator.rb",
    "lib/hawknee.rb",
    "lib/hawknee/cli.rb",
    "lib/hawknee/colors.rb",
    "lib/hawknee/commands/new.rb",
    "lib/hawknee/engine.rb",
    "lib/hawknee/helpers.rb",
    "lib/hawknee/version.rb",
    "public/stylesheets/main.css",
    "test/helper.rb",
    "test/test_hawknee.rb"
  ]
  s.homepage = %q{http://github.com/semahawk/hawknee}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Ruby on Rails 3 based forum.}
  s.test_files = [
    "test/helper.rb",
    "test/test_hawknee.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<haml>, ["~> 3.0.25"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<haml>, ["~> 3.0.25"])
    else
      s.add_dependency(%q<haml>, ["~> 3.0.25"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<haml>, ["~> 3.0.25"])
    end
  else
    s.add_dependency(%q<haml>, ["~> 3.0.25"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<haml>, ["~> 3.0.25"])
  end
end

