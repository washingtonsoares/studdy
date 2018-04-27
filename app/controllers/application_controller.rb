class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_user

  private

  def set_user
    cookies[:id] = current_user ? current_user.id : 'guest'
  end
end
