class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_user
    cgl_session.current_user
  end
  helper_method :current_user

  def rom
    ROM.env
  end

  private

  def cgl_session
    @_cgl_session = CGLSession.new(session, rom.relation(:users))
  end
end
