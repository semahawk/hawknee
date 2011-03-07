module Hawknee
	class InstallGenerator < Rails::Generators::Base
		source_root File.expand_path('../templates', __FILE__)
		
		def manifest
			copy_file "ability.rb", "app/models/ability.rb"
		end
	end
end
