module Hawknee
	class MainController < Hawknee::ApplicationController
		
		# GET /forum
		def index
			respond_to do |format|
				format.html { render :layout => 'hawknee/application' }
			end
		end
	end
end
