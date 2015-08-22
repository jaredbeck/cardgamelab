require "rails_helper"

RSpec.describe UserMapper do
  it "maps UsersRelation to User" do
    rom = ROM.env
    rom.command(:users).create.call([
      {
        email: 'alice@example.com',
        family_name: "Doe",
        given_name: "Alice",
        password_digest: "asdfasdf",
        created_at: Time.current,
        updated_at: Time.current
      }
    ])
    users = rom.relation(:users).map_with(:user)
    expect(users.count).to eq(1)
    expect(users.first).to be_a(User)
    expect(users.first.given_name).to eq("Alice")
  end
end
