require 'rails_helper'

RSpec.describe 'Appointment API' do
  # Initialize the test data
  let(:user) { create(:user) }
  let(:treatment) { create(:treatment) }
  let(:doctor) { create(:doctor) }
  let!(:appointments) do
    create_list(
      :appointment, 20, user_id: user.id, doctor_id: doctor.id, treatment_id: treatment.id
    )
  end
  let(:id) { appointments.first.id }

  # Test suite for GET /appointments
  describe 'GET /appointments' do
    before { get '/appointments', params: {} }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
