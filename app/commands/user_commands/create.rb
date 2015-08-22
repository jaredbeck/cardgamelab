module UserCommands
  class Create < ROM::Commands::Create[:sql]
    relation :users
    register_as :create
    result :one

    # define a validator to use
    # validator UserValidator

    def execute(tuples)
      super(timestamp(tuples, Time.current))
    end

    private

    def timestamp(tuples, time)
      tuples.map { |tup| tup.merge(created_at: time, updated_at: time) }
    end
  end
end
