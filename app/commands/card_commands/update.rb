module CardCommands
  class Update < ROM::Commands::Update[:sql]
    relation :cards
    register_as :update
    result :one

    # define a validator to use
    # validator CardValidator
  end
end
