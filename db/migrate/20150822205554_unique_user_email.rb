ROM::SQL.migration do
  up do
    execute "create unique index uniq_users_email on users (lower(email))"
  end

  down do
    execute "drop index uniq_users_email"
  end
end
