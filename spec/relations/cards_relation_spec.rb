require "rails_helper"

RSpec.describe CardsRelation do
  describe "#all" do
    it "returns all cards" do
      rom = ROM.env
      rom.command(:cards).create.call([
        { name: 'Banana' },
        { name: 'King Mukluk' }
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
