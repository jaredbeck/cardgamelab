ROM::SQL.migration do
  up do
    create_table :users do |t|
      primary_key :id
      column :email, :text, null: false
      column :family_name, :text, null: false
      column :given_name, :text, null: false
      column :password_digest, :text, null: false
      column :created_at, :timestamp, null: false
      column :updated_at, :timestamp, null: false
    end
  end

  down do
    drop_table :users
  end
end
