class CardsRelation < ROM::Relation[:sql]
  dataset :cards
  register_as :cards

  def all
    select(:id, :name).order(:name)
  end

  def by_user(user)
    all.where(user_id: user.id)
  end
end
