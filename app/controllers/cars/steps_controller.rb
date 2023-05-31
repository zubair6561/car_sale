class Cars::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Car.form_steps
  before_action :set_car, only: [:show, :update]

  def show
    render_wizard
  end

  def update
    if @car.update(car_params(step))
      render_wizard @car
    else
      render_wizard @car
    end
  end  
end

private

def car_params(step)
  permitted_attributes = case step
  when "details"
    [:car_model, :color, :price, :assembly_type, :transmission_type, :engine_capacity, :engine_detail, :milage, :city, :description, :user_id]
  when "images"
    [:images => []]
  when "contacts"
    [:primary_contact,:secondary_contact]
  end
  
  params.require(:car).permit(permitted_attributes).merge(form_step: step)

end

def set_car
  @car = Car.find(params[:car_id])
end


