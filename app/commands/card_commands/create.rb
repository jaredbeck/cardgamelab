module CardCommands
  class Create < ROM::Commands::Create[:sql]
    relation :cards
    register_as :create
    result :one

    # define a validator to use
    # validator CardValidator
  end
end
