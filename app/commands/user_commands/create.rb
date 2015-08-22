module UserCommands
  class Create < ROM::Commands::Create[:sql]
    relation :users
    register_as :create
    result :one

    # define a validator to use
    # validator UserValidator
  end
end
