module Hawknee::Cli::Command
	class New
		def init
			help
		end
		
		def topic
			puts "You're adding a new topic!"
			puts "Oorah!"
		end
		
		def forum
			puts "New forum fired up!"
		end
		
		def category
			puts "New category fired up!"
		end
		
		def help
			help = <<HELP
Usage: hawknee new topic|forum|category [options]
HELP
			
			puts help
		end

		def desc
			"Does nothin' yet."
		end
	end
end
