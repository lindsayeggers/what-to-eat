class WelcomeController < ApplicationController

	def index
	end

	def search
		response = HTTParty.get("https://api.foursquare.com/v2/search/recommendations?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&near=#{params[:search]}&intent=food&v=20200501")
		formattedReponse = JSON.parse(response.body)
		totalNumOfResults = formattedReponse["response"]["group"]["totalResults"]
		totalResults = formattedReponse["response"]["group"]["results"]
		randomNum = rand(totalNumOfResults)
		@eatHere = formattedReponse["response"]["group"]["results"][randomNum]
		puts "Eat here #{@eatHere}"
		# puts randomNum
		# totalResults = response['response']['totalResults']
		# groups = response['response']['groups']
		# puts groups
		# puts totalResults
		
		# randomNum = rand(@response['response']['venues'].length())
		# @restaurant = @response['response']['venues'][randomNum]
		# @address = @restaurant["location"]["address"]
		# @city = @restaurant["location"]["city"]
		# @state = @restaurant["location"]["state"]
		# @zipCode = @restaurant["location"]["postalCode"]
	end

end
