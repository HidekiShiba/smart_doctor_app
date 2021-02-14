class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :last_name, :first_name, :last_name_kana, :first_name_kana,
      :birth_date, :sex, :postal_code, :address, :tel, :is_unsubscribe_flag
    ])
  end
    
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
end
