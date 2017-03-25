require 'rails_helper'
RSpec.describe Api::V1::AirportsController do

  describe 'GET airports' do 
  
    context 'when valid params are passed' do

      let(:response) { double(status: 200, size: 10) }

      before do 
        allow(AirportService).to receive(:filter).and_return(response)
        subject { get :index, params: { code: 'AU'} }
      end

      it 'returns status code 200' do
        expect(response.status).to eq 200
      end

      it 'returns an array of result' do 
        expect(response.size).to eq 10
      end

    end

    context 'when invalid params are passed' do
      
      before do 
        allow(AirportService).to receive(:filter).and_return([])
        get :index, params: { code: 'Aust'}
      end

      it 'returns 404' do
        expect(response.status).to eq 404
      end

      it 'returns not found error message' do
        res = JSON.parse(response.body)
        expect(res['error_message']).to eq 'No record found'  
      end
      
    end

    context 'when method throws an error' do

      before do 
        allow(AirportService).to receive(:filter).and_raise
        get :index, params: { code: 'dddd'}
      end

      it 'returns 500' do
        expect(response.status).to eq 500 
      end

      it 'returns not found error message' do
        res = JSON.parse(response.body)
        expect(res['error_message']).to eq 'Internal server error'  
      end
      
    end

  end

end
