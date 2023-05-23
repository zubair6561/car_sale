class AfterSignupController < ApplicationController
include Wicked::Wizard

steps :confirm_password, :confirm_profile, :find_friends

  def show
    @user = current_user
    case step
    when :find_friends
      if @user.has_facebook_access_token?
        @friends = @user.find_friends
      else
        skip_step
      end
    end
  end

  def update
    @user = current_user
    case step
    when :confirm_password
      @user.update(user_params)
    end
    sign_in(@user, bypass: true) # needed for devise
    render_wizard @user
  end
  
  private
  def user_params
    params.require(:user)
          .permit(:email, :firstname) # ...
  end
end