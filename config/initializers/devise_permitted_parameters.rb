module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :nickname, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :nickname, :photo])
  end
end

Rails.application.configure do
  config.to_prepare do
    DeviseController.include DevisePermittedParameters
  end
end
