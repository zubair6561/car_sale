class CarsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @cars = if params[:query]&.values&.compact_blank&.present?
              PgSearch.multisearch(params[:query].values).map(&:searchable)
            else
              Car.all
            end
  end

  def create
    @car = current_user.cars.new
    @car.save(validate: false)
    redirect_to car_step_path(@car, Car.form_steps.first) 
  end

  def show
    @car = Car.find(params[:car_id])
    render_wizard
  end

  private

  def car_params
    params.require(:car).permit(:car_model, :city, :price,:color, :engine_detail, :transmission_type, :milage, :assembly_type, :engine_capacity, :description, :user_id, :secondary_contact, :primary_contact, :images => [])
  end
end
