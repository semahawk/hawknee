require 'hawknee/engine' if defined? Rails && Rails::VERSION::MAJOR == 3
require 'hawknee/helpers'

include Hawknee::Helpers

module Hawknee
	ROOT = File.expand_path(File.dirname(__FILE__))
	
	if using_windows?
		log "This gem was not tested under Windows and may not work properly.", "!!"
	end
end
