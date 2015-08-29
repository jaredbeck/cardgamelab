class CGLSession
  def initialize(session, users_relation)
    @users_relation = users_relation
    @session = session
  end

  def current_user
    @_current_user ||= load_current_user
  end

  private

  def clear_scu_id
    @session[:current_user_id] = nil
  end

  # Returns the user identified by `scu_id`. In the rare case
  # that a user cannot be found, clear the session to prevent
  # subsequent, unnecessary queries.
  def load_current_user
    load_user(scu_id).tap { |user| clear_scu_id if user.nil? }
  end

  def load_user(id)
    id && @users_relation.by_id(id).map_with(:user).first
  end

  def scu_id
    @session[:current_user_id]
  end
end
