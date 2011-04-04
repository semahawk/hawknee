module Hawknee::Cli::Command
	class New
		def init
			help
		end
		
		def topic
			puts "You're adding a new topic!"
			
			@topic[:title] = ask "Topic title: "
			@topic[:tag] = ask "Topic tag: "
			
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
	end
end
