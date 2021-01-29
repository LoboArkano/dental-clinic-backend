class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  belongs_to :treatment

  validates_inclusion_of :completed, in: [true, false]
  validates_presence_of :date, :completed, :doctor_id, :treatment_id
end
