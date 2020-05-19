class WelcomeController < ApplicationController

	def index
	end

	def result
		Restaurant.delete_all
		Restaurant.get_restaurants(params[:location])
		@eatHere = Restaurant.get_random_restaurant()
	end

	def reload
		@eatHere = Restaurant.get_random_restaurant()
	end
end
