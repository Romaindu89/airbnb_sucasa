class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization
  after_action :verify_authorized, except: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name photo bio])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name photo bio])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
