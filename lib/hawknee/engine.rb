require 'rails'

module Hawknee
	class Engine < Rails::Engine
		paths.config.routes = "config/routes.rb"
		config.serve_static_assets = true

		initializer "static assets" do |app|
			if app.config.serve_static_assets
				app.middleware.insert 0, ::ActionDispatch::Static, "#{root}/public"
			end
		end
	end
end
