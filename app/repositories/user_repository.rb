class UserRepository < ROM::Repository::Base
  relations :cards, :users

  def [](id)
    users.where(id: id).one!
  end

  def with_cards(id)
    users.by_id(id).combine_children(many: cards).one!
  end
end
