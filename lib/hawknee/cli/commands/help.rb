module Hawknee::Cli::Command
	class Help
		
		# Display help command usage note
		# 
		# @return [String] usage note text
		def init
			help = <<HELP
Usage: hawknee help <command> [options]
HELP
			
			puts help
		end

		def desc
			"Prints informations about specified command"
		end
		
		def commands
			# all the classes that inherits from Hawknee::Cli::Command. Actually, they're commands.
			commands = Hawknee::Cli::Command.constants.select {|c| Class === Hawknee::Cli::Command.const_get(c)}
			
			puts "\nHawknee commands are:\n\n"
			commands.each do |cmd|
				longest = commands.max_by(&:length).length
				spaces = (longest + 1) - cmd.length
				desc = eval "Hawknee::Cli::Command::#{cmd}.new.desc" if eval "Hawknee::Cli::Command::#{cmd}.new.respond_to? 'desc'"
				puts "  hawknee " + "#{cmd.downcase.to_s}".bold.colorize(:blue) + "#{" " * spaces}- #{desc}"
			end
			puts 
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
