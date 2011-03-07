module Hawknee
	class InstallGenerator < Rails::Generators::Base
		source_root File.expand_path('../templates', __FILE__)
		class_option :path, :type => :string, :default => "#{Dir.pwd}", :desc => "Sepcifies the directory where the app, you want to install Hawknee in, lives."
		
		def manifest
			puts "Welllcome to Hawknee installation script, stranger!\n\nInstallation to #{options[:path]}"
		end
	end
end
