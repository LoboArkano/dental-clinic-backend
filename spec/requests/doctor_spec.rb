require 'rails_helper'

RSpec.describe 'Doctors API' do
  # Initialize the test data
  let!(:doctors) { create_list(:doctor, 20) }
  let(:id) { doctors.first.id }

  # Test suite for GET /doctors
  describe 'GET /doctors' do
    before { get '/doctors', params: {} }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all todo doctors' do
      json = JSON.parse(response.body)
      expect(json['doctors'].size).to eq(20)
    end
  end

  # Test suite for GET /doctors/:id
  describe 'GET /doctors/:id' do
    before { get "/doctors/#{id}", params: {} }

    context 'when doctor exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the doctor' do
        json = JSON.parse(response.body)
        expect(json['doctor']['id']).to eq(id)
      end
    end
  end
end
