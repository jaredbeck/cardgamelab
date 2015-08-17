class CardsRelation < ROM::Relation[:sql]
  # gateway :default

  dataset :cards

  register_as :cards

  # define your methods here ie:
  #
  def all
    select(:id, :name).order(:name)
  end
end
