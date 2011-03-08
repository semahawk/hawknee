# For nice --options parsing
require 'optparse'

# Require some needed files
require 'hawknee/version'
require 'hawknee/colors'
require 'hawknee/helpers'

# For nice 'n' clean code
include Hawknee::Helpers

module Hawknee
	
	# You know.. Command Line Interface.. Got it? :)
	class Cli
		
		# Command classes inherit from this module, so we keep command class names separatly with classes somewhere in code.
		# In other words.. Only class which inherits from Hawknee::Cli::Command can be a command.
		module Command
			Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |f| require f }
		end
		
		# Initialize new Cli, and.. here we go!
		# 
		#     some enlightening:
		# 
		#     @command        - ARGV.first
		#     @options        - simple opts handler
		# 
		def initialize(*args)
			
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
			
			@command = ARGV.first.to_s if ARGV.first != nil
			
			# Here, in Hawknee, commands are simply classes, (kept in files in 'commands' directory) that inherits from Hawknee::Cli::Command.
			# To see it in action, dig a bit in lib/commands/new.rb file
			# 
			begin
				# We make sure the command (class) exists.
				eval "Hawknee::Cli::Command::#{@command.capitalize}.new"
			# When user typed some class (command) that doesn't exists.
			rescue BadCommand => e
				puts e.message
			# When typed ^C
			rescue Interrupt
				puts "\n[" + "interrupted".bold.colorize(:red) + "]"
			end
			
		end # initialize
		
		def run
			puts "Running.."
			eval "Hawknee::Cli::Command::#{@command.capitalize}.new"
			puts "Running done.."
		end # run
	end # Cli
end # Hawknee
