class WelcomeController < ApplicationController

	def index
	end

	def result
		Restaurant.delete_all
		@eatHere = Restaurant.get_restaurants(params[:location])
	end

	def reload
		@eatHere = Restaurant.get_random_restaurant()
	end
end
