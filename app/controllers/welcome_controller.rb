class WelcomeController < ApplicationController

	def index
	end

	def search
		response = HTTParty.get("https://api.foursquare.com/v2/search/recommendations?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&near=#{params[:search]}&intent=food&limit=50&v=20200501")
		formattedReponse = JSON.parse(response.body)
		totalResults = formattedReponse["response"]["group"]["results"]
		totalNumOfResults = totalResults.length() - 1
		
		if totalNumOfResults < 49
			puts "less than 50"
			randomNum = rand(totalNumOfResults)
		else
			puts "50 results"
			randomNum = rand(49)
		end
		
		@eatHere = formattedReponse["response"]["group"]["results"][randomNum]
	end

end
