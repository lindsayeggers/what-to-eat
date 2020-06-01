class WelcomeController < ApplicationController

	def index
	end

	def result
		begin
			Restaurant.delete_all
			@eatHere = Restaurant.get_restaurants(params[:location])
			@restaurants = Restaurant.all
		rescue
			redirect_to root_path, notice: "Oops, something went wrong. Try again later..."
		end
	end

	def reload
		@eatHere = Restaurant.get_random_restaurant()
		render 'result'
	end
end
