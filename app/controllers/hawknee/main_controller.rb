module Hawknee
	class MainController < Hawknee::ApplicationController
		
		# GET /forum
		def index
			render :layout => 'hawknee/application'
		end
	end
end
