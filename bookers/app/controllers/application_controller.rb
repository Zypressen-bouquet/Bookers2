class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_up_path_for(resource)
        flash[:message] = "Welcome! You have signed up successfully."
        user_path(current_user.id)
    end

    def after_sign_in_path_for(resource)
        flash[:message] = "Signed in successfully."
        user_path(current_user.id)
    end

    def after_sign_out_path_for(resource)
        flash[:message] = "Signed out successfully."
        root_path
    end

  protected
  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end