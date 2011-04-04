module Hawknee::Cli::Command
	class Help
		
		# 
		# Displays help command usage note
		# 
		# @return [String] usage note text
		# 
		def init
			help = <<HELP
Usage: hawknee help <command> [options]
HELP
			
			puts help
		end
		
		# klasses => all the classes that inherits from Hawknee::Cli::Command. Actually, they're commands.
		klasses = Hawknee::Cli::Command.constants.select {|c| Class === Hawknee::Cli::Command.const_get(c)}
		klasses.each do |klass|
			eval "def #{klass.downcase}
						Hawknee::Cli::Command::#{klass}.new.help
					end" unless klass == :Help
		end
	end
end
