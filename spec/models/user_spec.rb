require 'rails_helper'

# Test suite for the Appointment model
RSpec.describe User, type: :model do
  # User test
  context 'association' do
    it 'should have many appointments' do
      a = User.reflect_on_association(:appointments)
      expect(a.macro).to eq(:has_many)
    end
  end

  context 'validations' do
    it 'User cannot be blank ' do
      expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'Name cannot be blank ' do
      user = User.new(name: '', email: 'jenifer@hotmail.com', password: '1234')
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
