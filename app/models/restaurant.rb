class Restaurant < ApplicationRecord
	def self.get_restaurants(location)
		offset = 0
		limit = 50
		results = []
		loop do
			response = HTTParty.get("https://api.foursquare.com/v2/search/recommendations?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&near=#{location}&	intent=food&limit=#{limit}&offset=#{offset}&v=20200501")
			formattedReponse = JSON.parse(response.body)
			rawResults = formattedReponse["response"]["group"]["results"]
			totalResults = formattedReponse["response"]["group"]["totalResults"]
			rawResults.each do |r|
				results << {
					name: r["venue"]["name"],
					address: r["venue"]["location"]["address"],
					city: r["venue"]["location"]["city"],
					state: r["venue"]["location"]["state"],
					zipCode: r["venue"]["location"]["postalCode"],
					photo: r["photo"],
					review: r["snippets"]["items"][0]["detail"]
				}
			end
			offset += limit
			break if offset >= totalResults
		end
		results
	end
end
