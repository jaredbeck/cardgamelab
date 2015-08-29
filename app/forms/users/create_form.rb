module Users
  class CreateForm < ROM::Model::Form
    inject_commands_for :users

    input do
      set_model_name 'User'
      attribute :email, String
      attribute :family_name, String
      attribute :given_name, String
      attribute :password, String
      timestamps
    end

    validations do
      relation :users # For email uniqueness

      validates :email,
        presence: true,
        format: /@/,
        uniqueness: { case_sensitive: false }
      validates :family_name, presence: true, format: /\A[A-Z]/
      validates :given_name, presence: true, format: /\A[A-Z]/
      validates :password, presence: true, length: { minimum: 8 }
    end

    # TODO: The manual validation here feels like a hack.
    # Is there a better way?
    def commit!
      validate!
      unless @errors.empty?
        return ROM::Commands::Result::Failure.new("Invalid")
      end
      users.try { users.create.call(attributes) }
    end
  end
end
