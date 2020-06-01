class WelcomeController < ApplicationController

	def index
	end

	def result
		begin
			Restaurant.delete_all
			Restaurant.get_restaurants(params[:location])
			@restaurants = Restaurant.all
		rescue
			redirect_to root_path, notice: "Oops, something went wrong. Try again later..."
		end
	end
end
