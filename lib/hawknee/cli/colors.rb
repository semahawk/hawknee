module Hawknee
	class Cli
		
		# Effects for lines in terminal
		Effects = {
			:clear => "\e[0m",
			:bold => "\e[1m",
			
			:underline => "\e[4m",
			:blink => "\e[5m",
			:reverse => "\e[7m",
			:hide => "\e[8m",
		}
		
		# Colors for lines in terminal
		Colors = {
			:black => "\e[30m",
			:red => "\e[31m",
			:green => "\e[32m",
			:yellow => "\e[33m",
			:blue => "\e[34m",
			:magenta => "\e[35m",
			:cyan => "\e[36m",
			:white => "\e[37m",
			:default => "\e[39m",
			
			:on_black => "\e[40m",
			:on_red => "\e[41m",
			:on_green => "\e[42m",
			:on_yellow => "\e[43m",
			:on_blue => "\e[44m",
			:on_magenta => "\e[45m",
			:on_cyan => "\e[46m",
			:on_white => "\e[47m",
			:on_default => "\e[49m",
		}
	end
end

class String
	
	# Colorizes a string
	def colorize(symbol)
		string = self
		"#{Hawknee::Cli::Colors[symbol.downcase.to_sym]}#{string}#{Hawknee::Cli::Effects[:clear]}"
	end
	
	# Makes a string bold
	def bold
		string = self
		"#{Hawknee::Cli::Effects[:bold]}#{string}#{Hawknee::Cli::Effects[:clear]}"
	end
	
	# Hides a string
	def hide
		string = self
		"#{Hawknee::Cli::Effects[:hide]}#{string}#{Hawknee::Cli::Effects[:clear]}"
	end
	
	# Underlines a string
	def underline
		string = self
		"#{Hawknee::Cli::Effects[:underline]}#{string}#{Hawknee::Cli::Effects[:clear]}"
	end
	
	# Reverses foreground and background colors
	def reverse
		string = self
		"#{Hawknee::Cli::Effects[:reverse]}#{string}#{Hawknee::Cli::Effects[:clear]}"
	end
	
	# To be honest.. Dunno what this does :D
	def blink
		string = self
		"#{Hawknee::Cli::Effects[:blink]}#{string}#{Hawknee::Cli::Effects[:clear]}"
	end
end
