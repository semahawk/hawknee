module Hawknee::Helpers
	extend self
	
	def ask(what)
		print what
		$stdin.gets.chomp.strip
	end
	
	# Ask user if he wants to do something. If he passed 'n' it exits.
	# 
	#     usage examples:
	# 
	#     confirm?                         # Puts "Are you sure to continue? (y/n): ", and waits for input
	#     confirm? "Delete?"               # Puts "Delete? (y/n): ", and waits for input
	#     puts "Confirmed" if confirm?     # Puts "Confirmed" if user passed 'y'
	# 
	def confirm?(what = "Are you sure to continue?")
		print what + " (y/n): " # Hmmm... DRY? Yeah. DRY. We keep ourselves before writing (y/n): several times.
		if $stdin.gets.chomp.strip =~ /y/i then true else exit end # Exit if input != y
	end
	
	# Used to check if command user passed exists. If not, raises BadCommand, and shows appropriate note.
	# 
	#     usage examples:
	# 
	#     puts "Good" if command_exists? 'initialize'
	# 
	def command_exists?
		begin
			true if eval "Hawknee::Cli::Command::#{@command.capitalize}.new"
		rescue NameError
			raise BadCommand
		end
	end
	
	# Check if user typed command like add:topic
	def subcommand?(command)
		true if command =~ /(.*?)\:(.*?)/i
	end
	
	### Exceptions/errors down here
	class BadOption < RuntimeError
		def initialize
			puts "Ooops!".bold.colorize(:red) + " It seems, you passed invalid option"
			puts "Run with " + "-h".bold.colorize(:blue) + " or " + "--help".bold.colorize(:blue) + " option, to get some help."
			exit
		end
	end
	
	class BadCommand < RuntimeError
		def initialize
			puts "Ooops!".bold.colorize(:red) + " It seems, you typed some invalid command"
			puts "Run with " + "-h".bold.colorize(:blue) + " or " + "--help".bold.colorize(:blue) + " option, to get some help."
			exit
		end
	end
end
