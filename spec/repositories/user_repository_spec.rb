require "rails_helper"

RSpec.describe UserRepository do
  let(:rom) { ROM.env }
  let(:repo) { described_class.new(rom) }
  let(:user) {
    rom.command(:users).create.call(
      email: 'alice@example.com',
      family_name: "Doe",
      given_name: "Alice",
      password_digest: "asdfasdf"
    )
  }
  let(:user_id) { user[:id] }

  describe "#[]" do
    it "finds one user by id" do
      found = repo[user_id]
      expect(found).to be_a(ROM::Struct)
      expect(found.given_name).to eq("Alice")
    end
  end

  describe "#with_cards" do
    it "finds one user and their cards" do
      rom.command(:cards).create.call([
        {
          name: "Ysera",
          user_id: user_id
        }
      ])
      found = repo.with_cards(user_id)
      expect(found).to be_a(ROM::Struct)
      expect(found.given_name).to eq("Alice")
      expect(found.cards).to be_an(Array)
      expect(found.cards.length).to eq(1)
      card = found.cards.first
      expect(card).to be_a(ROM::Struct)
      expect(card.name).to eq("Ysera")
    end
  end
end
