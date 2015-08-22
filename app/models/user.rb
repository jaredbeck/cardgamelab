class User
  include ActiveModel::Model

  attr_accessor :created_at
  attr_accessor :email
  attr_accessor :family_name
  attr_accessor :given_name
  attr_accessor :id
  attr_accessor :updated_at
end
