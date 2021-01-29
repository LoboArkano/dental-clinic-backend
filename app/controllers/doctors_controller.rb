class DoctorsController < ApplicationController
  def index
    doctors = Doctor.all
    render json: {
      doctors: doctors
    }
  end

  def show
    doctor = Doctor.find(params['doctor']['id'])
    render json: {
      doctor: doctor
    }
  end

  def create
    Doctor.create!(
      name: params['doctor']['name']
    )
  end
end
