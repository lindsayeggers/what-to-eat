class Restaurant < ApplicationRecord
	def self.get_restaurants(location)
		response = HTTParty.get("https://api.foursquare.com/v2/search/recommendations?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&near=#{location}&intent=food&limit=50&v=20200501")
		formattedReponse = JSON.parse(response.body)
		raw_results = formattedReponse["response"]["group"]["results"]
		results = raw_results.map do |result|
			{
				name: result["venue"]["name"],
				address: result["venue"]["location"]["address"],
				city: result["venue"]["location"]["city"],
				state: result["venue"]["location"]["state"],
				zipCode: result["venue"]["location"]["postalCode"],
				website: result["venue"]["url"]
			}
		end

		Restaurant.import(results)
		get_random_restaurant()
	end

	def self.get_random_restaurant
		restaurants = Restaurant.all
		randomNum = rand(restaurants.length() - 1)
		restaurants[randomNum]
	end
	
end
