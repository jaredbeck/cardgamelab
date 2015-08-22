require "rails_helper"

module UserCommands
  RSpec.describe Update do
    describe "#call" do
      it "updates specified record" do
        rom = ROM.env
        alice = rom.command(:users).create.call([
          {
            email: 'alice@example.com',
            family_name: "Doe",
            given_name: "Alice",
            password_digest: "asdfasdf"
          }
        ])
        rom.command(:users).update.by_id(alice[:id]).call(family_name: "Solnic")
        alice = rom.relation(:users).by_id(alice[:id]).first
        expect(alice[:family_name]).to eq("Solnic")
      end
    end
  end
end
