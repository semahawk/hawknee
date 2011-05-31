Hawknee
=======

**Homepage**:         [http://semahawk.github.com/hawknee](http://semahawk.github.com/hawknee)    
**Author**:           Szymon Urbaś (szymon{dot}urbas{at}yahoo{dot}com)    
**License**:          MIT License    
**Copyright**:        2011    
**Latest version**:   0.2.1    
**Stage**:            **Development** (it isn't and won't be working until version 1.y.z)    
**Release day**:      March 20th, 2011    

A bit about
-----------

Hawknee is a gem that implements a forum, to your Rails 3.0 application.

Features
--------

* Existence, at the moment :D

Installation
------------

**Attention**. Hawknee is at development stage, intructions listed below *will* install it, but Hawknee itself *won't* work. You have been warned.

To install Hawknee, you would need to type:

     $ gem install hawknee

You can also get the gem package from [here](http://www.rubygems.org/gems/hawknee), and install Hawknee by typing:

     $ cd /path/to/hawknee-x.y.z.gem
     $ gem install hawknee-x.y.z.gem

Afterwards, to install the forum:

     $ cd /path/to/your/rails/app/path  # Go to your Rails application
     $ edit Gemfile                     # Put there: gem 'hawknee', 'x.y.z'
     $ bundle install                   # Install all the required gems (including Hawknee)
     $ rails server                     # Run the server.

And then just go to [*http://localhost:3000/forum*](http://localhost:3000/forum) and... here you are!

Requirements
------------

- rails >= 3.0.0

Hey, it's not working...
------------------------

According to [Semantic Versioning](http://semver.org/) - *"Major version zero (0.y.z) is for initial development. Anything may change at any time. The public API should not be considered stable."*
So, Hawknee isn't working, and won't be until version 1.y.z.

Contributing to Hawknee
-----------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Szymon Urbaś, under the **MIT** license. See LICENSE.txt for further details.
