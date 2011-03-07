# For nice --options parsing
require 'optparse'

# Require some needed files
require 'hawknee/version'
require 'hawknee/colors'
require 'hawknee/helpers'

# Require the commands
Dir[File.dirname(__FILE__) + './commands/*.rb'].each do |file|
	require File.basename(file, File.extname(file))
end

# For nice 'n' clean code
include Hawknee::Helpers

module Hawknee
	
	# You know.. Command Line Interface.. Got it? :)
	class Cli
		
		# Command classes inherit from this module, so we keep command class names separatly with classes somewhere in code.
		# In other words.. Only class which inherits from Hawknee::Command can be a command.
		module Command; end
		
		# Initialize new Cli, and.. here we go!
		# 
		#     some enlightening:
		# 
		#     command         - ARGV.first: eg. init, add, delete
		#     @command        - the same, but in @variable
		#     @subcommand     - second ARGV
		#     @options        - simple opts handler
		# 
		def initialize(command, *args)
			
			# Handles options
			@options = {}
			
			begin
				opts = OptionParser.new do |opts|
					opts.on('-v', '--version', 'Show version') do
						puts "Hawknee " + Hawknee::Version::STRING
						exit
					end
					
					opts.on('-h', '--help', 'Display this message') do
						puts opts
						exit
					end
				end.parse!
			rescue OptionParser::InvalidOption => e
				raise BadOption
			end
			
			@command = command
			@subcommand = ARGV[1] == nil ? ARGV[1] : 'init'
			
			# Here, in Hawknee, commands are simply classes, (kept in files in 'commands' directory) that inherits from Hawknee::Command.
			# Subcommands are just functions of this classes.
			# To see it in action, dig a bit in lib/commands/add.rb file
			# 
			begin
				# We make sure the command (class) exists.
				run if command_exists? @command.capitalize
			# When user typed some class (command) that doesn't exists.
			rescue BadCommand => e
				puts e.message
			# When typed ^C
			rescue Interrupt
				puts "\n[" + "interrupted".bold.colorize(:red) + "]"
			end
			
		end # initialize
		
		def run
			eval "Hawknee::Cli::Command::#{@command.capitalize}.new.#{@subcommand}"
		end # run
	end # Cli
end # Hawknee
