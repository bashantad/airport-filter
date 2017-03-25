require './app/services/airport_service'

RSpec.describe AirportService do
  
	describe '.filter' do
		
		context "when code is passed" do 
			
			it "filters by code" do
				result = AirportService.filter({'code' => 'BHX'})
				expect(result[0]['display_name']).to eq 'Birmingham (UK)'
				expect(result[0]['international_airport']).to eq true
			end

		end

		context "when international_airport is passed" do 
			
			it "filters by international_airport" do
				result = AirportService.filter({'international_airport' => true})
				expect(result.size).to eq 4
				expect(result.collect{|r| r['code'] }).to eq ["BHD", "BHX", "ADL", "BNE"]
			end

		end

		context "when regional_airport is passed" do 
			
			it "filters by regional_airport" do
				result = AirportService.filter({'regional_airport' => true})
				expect(result.size).to eq 1
				expect(result[0]['display_name']).to eq 'Cobar'
			end

		end

		context "when code is country_code" do 
			
			it "filters by code" do
				result = AirportService.filter({'country_code' => 'AU'})
				expect(result.size).to eq 4
				expect(result.collect{|r| r['code'] }).to eq ["BZD", "ADL", "BNE", "CAZ"]
			end

		end

		context "when multiple params are passed" do 
			
			it "filters by all params" do
				result = AirportService.filter({'country_code' => 'GB', 'international_airport': true})
				expect(result.size).to eq 2
				expect(result.collect{|r| r['display_name']}).to eq ["Belfast (City)", "Birmingham (UK)"]
			end

		end

	end

end
