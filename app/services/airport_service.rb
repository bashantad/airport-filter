class AirportService 
	API_URL = 'https://www.qantas.com.au/api/airports'
	class << self
		def filter(params)
			Rails.cache.fetch "#{cache_key(params)}", :expires_in => 12.hours do
				Rails.logger.info "writing data for the request with key: #{cache_key(params)}"
				response  = HTTParty.get(API_URL)
				body      = JSON.parse(response.body)
				records   = body['airports']
				records.select{ |record| record_matches?(record, params) }
  	  end
		end

		def record_matches?(record, params)
			country_match = (params['country_code'].present? ? record['country']['code'] == params['country_code'] : true)
			other_match   = ['code', 'international_airport', 'regional_airport'].all? do |attribute|
				params[attribute].present? ? record[attribute].to_s == params[attribute].to_s : true
			end
			country_match && other_match
		end

		def cache_key(params)
			"airports-#{params['country_code']}-#{params['international_airport']}-#{params['regional_airport']}-#{params['code']}-list"
		end
	end
end