class CardMapper < ROM::Mapper
  relation :cards

  register_as :card

  # specify model and attributes ie
  #
  # model Card
  #
  attribute :name
end
