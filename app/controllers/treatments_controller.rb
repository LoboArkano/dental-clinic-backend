class TreatmentsController < ApplicationController
  def index
    treatments = Treatment.all
    render json: {
      treatments: treatments
    }
  end

  def show
    treatment = Treatment.find(params['id'])
    render json: {
      treatment: treatment
    }
  end

  def create
    Treatment.create!(
      name: params['treatment']['name'],
      price: params['treatment']['price'],
      desc: params['treatment']['desc']
    )
  end
end
