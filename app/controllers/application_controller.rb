class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirects to login page after logout
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def after_sign_in_path_for(resource)
    if resource.seller?
      dashboard_index_path  # Sellers go to Dashboard
    else
      products_path         # Buyers go to Products Page
    end
  end
end
