class CardMapper < ROM::Mapper
  relation :cards
  register_as :card
  model Card

  # TODO: Duplicated in Card
  attribute :id
  attribute :name
  attribute :user_id
end
