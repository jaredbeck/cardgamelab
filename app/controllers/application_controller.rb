class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_user
    @_current_user ||= load_current_user
  end
  helper_method :current_user

  def rom
    ROM.env
  end

  private

  def load_current_user
    scu_id = session[:current_user_id]
    scu_id && rom.relation(:users).by_id(scu_id).map_with(:user).first
  end
end
