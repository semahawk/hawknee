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
			
			# Set up the command and subcommand
			@command, @subcommand = parse_command
			
			begin
				opts = OptionParser.new do |opts|
					opts.banner = "Usage: hawknee COMMAND [OPTIONS]"
					
					opts.separator " "
					
					opts.separator "Installing Hawknee:"
					opts.separator "    rails new app_name                 # Make new Rails application"
					opts.separator "    cd app_name                        # Switch to the app's directory"
					opts.separator "    gedit Gemfile                      # Add: gem 'hawknee', '#{Hawknee::Version::STRING}'"
					opts.separator "    rails generate hawknee:install     # Copies needed files"
					opts.separator "    rails server                       # Runs the server"
					opts.separator "    go to http://localhost:3000/forum"
					opts.separator " "
					opts.separator "    Have fun!"
					
					opts.separator " "
					
					opts.separator "Common options:"
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
			
			# Here, in Hawknee, commands are simply classes, (kept in files in 'commands' directory) that inherits from Hawknee::Cli::Command.
			# To see it in action, dig a bit in lib/commands/new.rb file
			# 
			begin
				# We make sure the command (class) exists.
				run if command_exists?
			# When user typed some class (command) that doesn't exists.
			rescue BadCommand => e
				puts e.message
			# When typed ^C
			rescue Interrupt
				puts "\n[" + "interrupted".bold.colorize(:red) + "]"
			end
			
		end # initialize
		
		def run
			begin
				eval "Hawknee::Cli::Command::#{@command.capitalize}.new.#{@subcommand}"
			rescue NameError, NoMethodError
				raise BadCommand
			end
		end # run

		def parse_command
			case ARGV.length
         	when 1
					return ARGV.first.to_s, "init"
				when 2
					if ARGV[1] != nil
						return ARGV.first.to_s, ARGV[1].to_s
					end
			end
		end
	end # Cli
end # Hawknee
