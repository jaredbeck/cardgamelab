module CardCommands
  class Delete < ROM::Commands::Delete[:sql]
    relation :cards
    register_as :delete
    result :one
  end
end
