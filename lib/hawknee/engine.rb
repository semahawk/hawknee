require 'rails'

module Hawknee
	class Engine < Rails::Engine
		engine_name :hawknee
		paths.config.routes = "config/routes.rb"
	end
end
