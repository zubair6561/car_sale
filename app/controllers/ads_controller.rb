class AdsController < Wicked::WizardController
  include Wicked::Wizard

  steps *Car.form_steps
  def create
    # byebug
    @ad = Ad.new
    @ad.save(validate: false)
    redirect_to ad_step_path(@car, Car.steps.first)
  end

  def show
    # byebug
    # @ad = Ad.find(params[:ad_id])
    render_wizard
  end
 
 
 
 
 
 
  # steps :step1, :step2, :step3
  # def show
  #   @user = current_user
  #   render_wizard
  # end

  # def update
  #   byebug
  #   @user = current_user
  #   @user.update(user_params)
  #   render_wizard @user
  # end

  # def finish_wizard_path
  #   ad = current_user.ads.find(params[:ad_id])
  #   ads_success_path(ad)
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:firstname ,:email)
  # end
end
