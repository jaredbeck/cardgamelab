class UsersRelation < ROM::Relation[:sql]
  dataset :users
  register_as :users

  def all
    select(:id, :email, :family_name, :given_name).order(:family_name)
  end

  def by_email(email)
    where(email: email)
  end

  def by_id(id)
    where(id: id)
  end
end
