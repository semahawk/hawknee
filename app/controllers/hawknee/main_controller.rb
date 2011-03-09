module Hawknee
	class MainController < Hawknee::ApplicationController
		def index
			render :text => "Aye, comrade! Forum fired up!"
		end
	end
end
