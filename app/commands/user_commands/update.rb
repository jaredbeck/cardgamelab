module UserCommands
  class Update < ROM::Commands::Update[:sql]
    relation :users
    register_as :update
    result :one

    def execute(tuple)
      super(timestamp(tuple, Time.current))
    end

    private

    def timestamp(tuple, time)
      tuple.merge(updated_at: time)
    end
  end
end
