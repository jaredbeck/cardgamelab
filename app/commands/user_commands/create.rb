require 'scrypt'

module UserCommands
  class Create < ROM::Commands::Create[:sql]
    relation :users
    register_as :create
    result :one

    def execute(tuple)
      super(timestamp(digest(tuple.to_h), Time.current))
    end

    private

    def digest(tuple)
      t = tuple.dup
      p = t.delete(:password)
      t[:password_digest] = SCrypt::Password.create(p)
      t
    end

    def timestamp(tuple, time)
      tuple.merge(created_at: time, updated_at: time)
    end
  end
end
