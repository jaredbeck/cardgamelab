module CardCommands
  class Create < ROM::Commands::Create[:sql]
    relation :cards
    register_as :create
    result :one
  end
end
