class Api::V1::AirportsController < ApplicationController
	
	def index
		response = AirportService.filter(api_params)
		if response.empty?
			json_response({error_message: 'No record found'}, :not_found)
		else
			json_response(response)
		end
	end

	def api_params
		params.permit(:country_code, :code, :international_airport, :regional_airport)
	end
end