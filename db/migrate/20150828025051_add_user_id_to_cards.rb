ROM::SQL.migration do
  up do
    # There's no production data yet, so it's ok to truncate
    # the cards table here.
    execute <<-SQL
      truncate table cards;

      alter table cards
      add column user_id integer not null
      references users (id)
      on delete cascade
      on update cascade;
    SQL
  end

  down do
    execute <<-SQL
      alter table cards
      drop column user_id;
    SQL
  end
end
