class AppointmentsController < ApplicationController
  include CurrentUserConcern

  def index
    if @current_user
      apps = @current_user.appointments
      render json: apps.to_json(include: %i[doctor treatment])
    else
      render json: { status: 404 }
    end
  end

  def create
    appointment = @current_user.appointments.create!(
      date: params['appointment']['date'],
      completed: true,
      doctor_id: params['appointment']['doctor_id'],
      treatment_id: params['appointment']['treatment_id']
    )
    appointment.toggle!(:completed)

    if appointment
      render json: {
        status: :created,
        appointment: appointment
      }
    else
      render json: { status: 500 }
    end
  end
end
