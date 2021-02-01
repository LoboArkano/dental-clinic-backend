require 'rails_helper'

# Test suite for the Appointment model
RSpec.describe Treatment, type: :model do
  # Treatment test
  context 'association' do
    it 'should have many appointments' do
      a = Treatment.reflect_on_association(:appointments)
      expect(a.macro).to eq(:has_many)
    end
  end

  context 'validations' do
    it 'Treatment cannot be blank ' do
      expect { Treatment.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'Name cannot be blank ' do
      treatment = Treatment.new(name: '', price: 100, desc: 'Ipsum')
      expect { treatment.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
