module CardCommands
  class Update < ROM::Commands::Update[:sql]
    relation :cards
    register_as :update
    result :one
  end
end
