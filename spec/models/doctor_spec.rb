require 'rails_helper'

# Test suite for the Appointment model
RSpec.describe Doctor, type: :model do
  # Doctor test
  context 'association' do
    it 'should have many appointments' do
      a = Doctor.reflect_on_association(:appointments)
      expect(a.macro).to eq(:has_many)
    end
  end

  context 'validations' do
    it 'Doctor cannot be blank ' do
      expect { Doctor.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'Name cannot be blank ' do
      doc = Doctor.new(name: '')
      expect { doc.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
