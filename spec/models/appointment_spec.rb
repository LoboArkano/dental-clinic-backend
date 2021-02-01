require 'rails_helper'

# Test suite for the Appointment model
RSpec.describe Appointment, type: :model do
  # Association test
  context 'association' do
    it 'should have one user' do
      a = Appointment.reflect_on_association(:user)
      expect(a.macro).to eq(:belongs_to)
    end
    it 'should have one doctor' do
      a = Appointment.reflect_on_association(:doctor)
      expect(a.macro).to eq(:belongs_to)
    end
    it 'should have one treatment' do
      a = Appointment.reflect_on_association(:treatment)
      expect(a.macro).to eq(:belongs_to)
    end
  end

  context 'validations' do
    let(:user) { User.create(name: 'Jenifer', email: 'jenifer@hotmail.com', password: '1234', password_confirm: '1234') }
    let(:doctor) { Doctor.create(name: 'Jaskier') }
    let(:treatment) { Treatment.create(name: 'Lorem', price: 100, desc: 'Ipsum') }

    it 'Appointment cannot be blank ' do
      expect { Appointment.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'Date cannot be blank ' do
      app = Appointment.new(date: '', completed: true, doctor_id: doctor.id, treatment_id: treatment.id)
      expect { app.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
