class WelcomeController < ApplicationController

	def index
	end

	def result
		Restaurant.delete_all
		response = HTTParty.get("https://api.foursquare.com/v2/search/recommendations?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&near=#{params[:location]}&intent=food&limit=50&v=20200501")
		formattedReponse = JSON.parse(response.body)
		totalResults = formattedReponse["response"]["group"]["results"]
		totalResults.each do |result|
			Restaurant.create(
				name: result["venue"]["name"],
				address: result["venue"]["location"]["address"],
				city: result["venue"]["location"]["city"],
				state: result["venue"]["location"]["state"],
				zipCode: result["venue"]["location"]["postalCode"],
				website: result["venue"]["url"]
			)
		end
		restaurants = Restaurant.all
		restaurants = restaurants.as_json
		randomNum = rand(restaurants.length() - 1 )
		@eatHere = restaurants[randomNum]
	end

	def reload
		restaurants = Restaurant.all
		restaurants = restaurants.as_json
		randomNum = rand(restaurants.length() - 1 )
		@eatHere = restaurants[randomNum]
	end
end
