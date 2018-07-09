class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_user

  private

  def set_college
    referer = request.host_with_port

    @college = College.find_by_url(referer)

    redirect_to "/404.html" if @college.nil?
  end

  def set_user
    cookies[:id] = current_user ? current_user.id : 'guest'
  end
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
