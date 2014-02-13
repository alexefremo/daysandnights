class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:provider, :uid, :profile_name, :about, :gender, :location, :right, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:provider, :uid, :profile_name, :about, :gender, :location, :right, :email, :password, :current_password) }
  end

def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def server_error
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/error', status: 400 }
      format.all  { render nothing: true, status: 500}
    end
end

end
