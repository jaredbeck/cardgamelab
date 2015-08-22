class UsersRelation < ROM::Relation[:sql]
  dataset :users
  register_as :users

  def all
    select(:id, :email, :family_name, :given_name).order(:family_name)
  end
end
