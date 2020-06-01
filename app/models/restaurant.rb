class Restaurant < ApplicationRecord
	def self.get_restaurants(location)
		offset = 0
		limit = 50

		loop do
			response = HTTParty.get("https://api.foursquare.com/v2/search/recommendations?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&near=#{location}&	intent=food&limit=#{limit}&offset=#{offset}&v=20200501")
			formattedReponse = JSON.parse(response.body)
			raw_results = formattedReponse["response"]["group"]["results"]
			totalResults = formattedReponse["response"]["group"]["totalResults"]
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
			offset += limit
			break if offset >= totalResults
		end
	end
end
