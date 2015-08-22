require "rails_helper"

RSpec.describe UsersRelation do
  describe "#all" do
    it "returns all cards" do
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
      result = rom.relation(:users).all.to_a
      expect(result).to be_an(Array)
      expect(result.length).to eq(1)
      expect(result[0][:given_name]).to eq("Alice")
    end
  end
end
