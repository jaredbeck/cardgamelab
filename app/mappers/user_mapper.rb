class UserMapper < ROM::Mapper
  relation :users

  register_as :user

  model User

  # TODO: Duplicated in User
  attribute :created_at
  attribute :email
  attribute :family_name
  attribute :given_name
  attribute :id
  attribute :password_digest
  attribute :updated_at
end
