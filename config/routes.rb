Rails.application.routes.draw do
	scope "forum", :module => :hawknee do
		controller "main" do
			match "/", :to => :index, :as => "portal"
		end
	end
end
