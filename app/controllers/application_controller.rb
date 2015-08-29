class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_user
    cgl_session.current_user
  end
  helper_method :current_user

  private

  # Returns a new instance of `CGLSession`, which decorates the rails
  # `session`. Within a controller action, the result can be cached, and the
  # cache can be cleared, for example when signing in or signing up.
  def cgl_session
    @cached_cgl_session ||= CGLSession.new(session, rom.relation(:users))
  end

  def clear_cgl_session_cache
    @cached_cgl_session = nil
  end

  def rom
    ROM.env
  end

  def sign_in(user_id)
    session[:current_user_id] = user_id
    clear_cgl_session_cache
  end
end
