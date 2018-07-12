class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CollegesHelper
  before_action :set_user, :set_college

  private

  def set_college
    get_college_from_request(request)
  end

  def set_user
    cookies[:id] = current_user ? current_user.id : 'guest'
  end
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
