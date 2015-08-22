class User
  include ActiveModel::Model

  # TODO: Duplicated in UserMapper
  attr_accessor :created_at
  attr_accessor :email
  attr_accessor :family_name
  attr_accessor :given_name
  attr_accessor :id
  attr_accessor :password_digest
  attr_accessor :updated_at

  def name
    format "%s %s", given_name, family_name
  end
end
