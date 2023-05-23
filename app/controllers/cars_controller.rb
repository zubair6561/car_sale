class CarsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @cars = if params[:query]&.values&.compact_blank&.present?
              PgSearch.multisearch(params[:query].values).map(&:searchable)
            else
              Car.all
            end
  end

  # def new
  #   @car = Car.new  
  # end 

  def create
    @car = Car.new
    @car.save(validate: false)
    redirect_to car_step_path(@car, Car.form_steps.first)
  end

  def show
    @car = Car.find(params[:car_id])
    render_wizard
  end


  
  # def create
  #    @car = Car.new(car_params)

  #   if @car.save
  #     # redirect_to car_path(@car)
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end

  #   # @car = Car.new
  #   # @car.save(validate: false)
  #   # redirect_to car_ad_path(@car, Car.form_steps.first), method: :put, action: :update
  # end

  private

  def car_params
    params.require(:car).permit(:car_model, :city, :price,:color, :engine_detail, :transmission_type, :milage, :assembly_type, :engine_capacity)
  end
end
