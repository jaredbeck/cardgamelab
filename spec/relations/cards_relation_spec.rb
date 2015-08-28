require "rails_helper"

RSpec.describe CardsRelation do
  let(:rom) { ROM.env }
  let(:user) {
    rom.command(:users).create.call([
      {
        email: 'alice@example.com',
        family_name: "Doe",
        given_name: "Alice",
        password_digest: "asdfasdf"
      }
    ])
  }

  describe "#all" do
    it "returns all cards" do
      rom.command(:cards).create.call([
        { name: 'Banana', user_id: user[:id] },
        { name: 'King Mukluk', user_id: user[:id] }
      ])
      result = rom.relation(:cards).all.to_a
      expect(result).to be_an(Array)
      expect(result.length).to eq(2)
      expect(result.map { |card| card[:name] }).to match_array([
        'Banana', 'King Mukluk'
      ])
    end
  end
end
