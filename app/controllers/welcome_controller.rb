class WelcomeController < ApplicationController

	def index
	end

	def result
		begin
			Restaurant.delete_all
			@eatHere = Restaurant.get_restaurants(params[:location])
		rescue
			redirect_to root_path, alert: "No restaurants found. Please try again."
		end
	end

	def reload
		@eatHere = Restaurant.get_random_restaurant()
		render 'result'
	end
end
