module Hawknee
	class InstallGenerator < Rails::Generators::Base
		source_root File.expand_path('../templates', __FILE__)
		
		def manifest
			puts "Welllcome to Hawknee, stranger!"
		end
	end
end
