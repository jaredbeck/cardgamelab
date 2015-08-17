ROM.setup(:sql, ENV.fetch("DATABASE_URL"))
ROM.finalize
