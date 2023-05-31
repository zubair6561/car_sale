class PostsController < ApplicationController
  def index
    @posts = current_user.posts.order(:id)
    
  end

  def create
    @car = current_user.cars.new
    @car.save(validate: false)
    @post = current_user.posts.new(car: @car)
    if @post.save
      redirect_to car_step_path(@car, Car.form_steps.first)
    else
      redirect_to root_path, notice: 'Unable to create Post'
    end
  end

  def edit
    @posts = current_user.cars.find(params[:id])
  end

  def update
    @posts = current_user.cars.find(params[:id])
    if params[:close_car].present?
      @posts.update(closed: true)
      redirect_to posts_path, notice: 'Car closed successfully.'
    elsif @posts.update(car_params)
      redirect_to posts_path, notice: 'Car information updated successfully.'
    else
      render 'edit'
    end
  end
  def close
    post = Post.find(params[:id])
    post.update(closed: !post.closed) if post.present?
    redirect_to posts_path
  end
  
  
  def show
    @posts = Car.find(params[:id])
  end

def destroy
  car = Car.find(params[:id])
  car.destroy

  redirect_to posts_path, notice: 'Car was successfully deleted.'
end

  private

  def car_params
    params.require(:car).permit(:car_model, :city, :price,:color, :engine_detail, :transmission_type, :milage, :assembly_type, :engine_capacity, :description, :user_id, :secondary_contact, :primary_contact, :images => [])
  end
end
    

