require 'rails_helper'

RSpec.describe 'Treatment API' do
  # Initialize the test data
  let!(:treatments) { create_list(:treatment, 20) }
  let(:id) { treatments.first.id }

  # Test suite for GET /treatments
  describe 'GET /treatments' do
    before { get '/treatments', params: {} }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all todo treatments' do
      json = JSON.parse(response.body)
      expect(json['treatments'].size).to eq(20)
    end
  end

  # Test suite for GET /treatments/:id
  describe 'GET /treatments/:id' do
    before { get "/treatments/#{id}", params: {} }

    context 'when treatment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the treatment' do
        json = JSON.parse(response.body)
        expect(json['treatment']['id']).to eq(id)
      end
    end
  end
end
