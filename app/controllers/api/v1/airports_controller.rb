class Api::V1::AirportsController < ApplicationController
	def index
		render json: Airport.filter(api_params)
	end

	def api_params
		params.permit(:country_code, :code, :international_airport, :regional_airport)
	end
end