class Card
  include ActiveModel::Model

  # TODO: Duplicated in CardMapper
  attr_accessor :id
  attr_accessor :name
  attr_accessor :user_id
end
