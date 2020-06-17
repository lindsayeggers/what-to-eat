class WelcomeController < ApplicationController

	def index
	end

	def result
		begin
			@restaurants = Restaurant.get_restaurants(params[:location])
		rescue
			redirect_to root_path, notice: "Oops, something went wrong. Try again later..."
		end
	end
end
