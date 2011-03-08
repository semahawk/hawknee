module Hawknee::Cli::Command
	class New
		def initialize
			options = {}
			opts = OptionParser.new do |opts|
				opts.on('-n', '--name NAME', 'Sets up the name for topic|forum|category') do |name|
					options[:name] = name
				end
			end.parse!
		end
		
		def init
			puts "New fired up!"
		end
		
		def topic
			puts "New topic fired up!"
		end
		
		def forum
			puts "New forum fired up!"
		end
	end
end
