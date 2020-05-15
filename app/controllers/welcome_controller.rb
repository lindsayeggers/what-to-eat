class WelcomeController < ApplicationController

	def index
	end

	def search
		response = HTTParty.get("https://api.foursquare.com/v2/search/recommendations?client_id=ZBFMRDI0GFSR5WP55VTUYLF5CXBADC3X4EN2OZTABMGQEHZJ&client_secret=24RBVH2L5LXADC1SEZCHXF3BOCSREGFAN2VVHDT3EFXQFBNX&near=#{params[:search]}&intent=food&v=20200501")
		formattedReponse = JSON.parse(response.body)
		totalNumOfResults = formattedReponse["response"]["group"]["totalResults"]
		totalResults = formattedReponse["response"]["group"]["results"]
		randomNum = rand(totalNumOfResults)
		@eatHere = formattedReponse["response"]["group"]["results"][randomNum]
		puts totalResults
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
