class OmniauthController < Devise::OmniauthCallbacksController

  skip_before_action :verify_authenticity_token, only: :facebook

  def facebook

    @user = User.create_from_provider_data(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url
    end

  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later'
    redirect_to new_user_registration_url
  end

end
