module Cards
  class CreateForm < ROM::Model::Form
    commands cards: :create

    input do
      set_model_name 'Card'
      attribute :name, String
    end

    validations do
      validates :name, presence: true
    end

    def commit!
      cards.try { cards.create.call(attributes) }
    end
  end
end
