class ApplicationController < ActionController::API
	def json_response(response, status = :ok)
    render json: response, status: status
  end

 	rescue_from Exception do |ex|
 		Rails.logger.error "Error message: #{ex.message}"
 		json_response({error_message: 'Internal server error'}, 500)
  end 
end
