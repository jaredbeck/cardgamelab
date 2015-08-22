class UserMapper < ROM::Mapper
  relation :users

  register_as :user

  model User

  attribute :created_at
  attribute :email
  attribute :family_name
  attribute :given_name
  attribute :id
  attribute :updated_at
  exclude :password_digest
end
