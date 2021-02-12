FactoryBot.define do
  factory :appointment do
    date { Faker::Time.forward(days: 23, period: :morning) }
    completed true
    user_id nil
    treatment_id nil
    doctor_id nil
  end
end
