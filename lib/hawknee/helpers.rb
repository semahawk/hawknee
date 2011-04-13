module Hawknee::Helpers
	
	# Log messages to the console
	# 
	# === Examples
	#   log "Debugging is now ON"        #=> "~> Debugging is now ON"
	#   log "Debugging is now ON", ">>"  #=> ">> Debugging is now ON"
	#   log "Debugging is now ON", ""    #=> "~> Debugging is now ON"
	# 
	# @return [String] what message to log
	def log(what, prompt = "~>")
		prompt = "~>" if prompt.empty?
		$stdout.puts "#{prompt} #{what}"
	end
	
	# Ask user something
	# 
	# === Examples
	#   ask "Why don't you like carrots?"
	# 
	# @return [String] the answer
	def ask(what)
		print what
		$stdin.gets.chomp.strip.to_s
	end
	
	# Ask user if he wants to do something. If he passed 'n' it exits.
	# 
	# === Examples
	#   confirm?                         # Puts "Are you sure to continue? (y/n): ", and waits for input
	#   confirm? "Delete?"               # Puts "Delete? (y/n): ", and waits for input
	#   puts "Confirmed" if confirm?     # Puts "Confirmed" if user passed 'y'
	# 
	# If you want it to return true, if user typed 'n':
	#   puts "Not confirmed" unless confirm?
	# 
	# @return [Boolean] true if user wants, false if not
	# 
	def confirm?(what = "Are you sure to continue?")
		print what + " (y/N): " # Hmmm... DRY? Yeah. DRY. We keep ourselves before writing (y/n): several times.
		if $stdin.gets.chomp.strip.empty? then exit end
		if $stdin.gets.chomp.strip =~ /(y|yes)/i then true else exit end # Exit if input != y
	end
	
	# Use it to check if command that user passed exists. If not, raises BadCommand, and shows appropriate note.
	# 
	# === Example:
	#   puts "Yay! Exists!" if command_exists? :Help
	# 
	def command_exists?(command)
		commands = Hawknee::Cli::Command.constants.select {|c| Class === Hawknee::Cli::Command.const_get(c)}
		if commands.include? command
			true
		else
			raise InvalidCommand
		end
	end
	
	# Check whether user uses Unix or not.
	# 
	# @return [Boolean] true if user is cool.
	def using_unix?
		RUBY_PLATFORM =~ /linux|darwin|solaris|cygwin|(free|open|net)bsd/
	end
	
	# Check whether user uses Windoze or not.
	# 
	# @return [Boolean] true if user doesn't know what is loosing.
	def using_windows?
		RUBY_PLATFORM =~ /mswin|win32|mingw/
	end
end
