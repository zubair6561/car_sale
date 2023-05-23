class Cars::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Car.form_steps
 
  def show
    @car = Car.find(params[:car_id])
    render_wizard
  end

  def update
    @car = Car.find(params[:car_id])
    @car.update(car_params(step))
    render_wizard @car
  end
end

private

  def car_params(step)
  	permitted_attributes = case step
  	  when "details"
  	    [:car_model, :color, :price, :assembly_type, :transmission_type, :engine_capacity, :engine_detail, :milage, :city]
  	  when "images"
  	    []
  	  when "contacts"
  	    []
  	  end

  	params.require(:car).permit(permitted_attributes).merge(form_step: step)
  end


