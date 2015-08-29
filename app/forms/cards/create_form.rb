module Cards
  class CreateForm < ROM::Model::Form
    commands cards: :create

    input do
      set_model_name 'Card'
      attribute :name, String
      attribute :user_id, Integer
    end

    validations do
      validates :name, presence: true
      validates :user_id, presence: true
    end

    # TODO: The manual validation here feels like a hack.
    # Is there a better way?
    def commit!
      validate!
      unless @errors.empty?
        return ROM::Commands::Result::Failure.new("Invalid")
      end
      cards.try { cards.create.call(attributes) }
    end
  end
end
