# Remember to make the class be in Hawknee::Cli::Command. Otherwise, it won't work :/
module Hawknee::Cli::Command
	
	# Class Add, so the command is 'add'.
	# 
	class Add
		
		# Function 'init'. If you want this command be working, be sure there is 'init' function.
		# 
		# Also, 'init' function is used as default subcommand.
		# So, 'hawknee add' will execute 'init' function.
		# 
		def init
			puts "Welllcome to Hawknee, stranger!"
		end
	end
end
