require "rails_helper"

module UserCommands
  RSpec.describe Create do
    let(:attributes) {
      {
        email: 'alice@example.com',
        family_name: "Doe",
        given_name: "Alice",
        password_digest: "asdfasdf"
      }
    }
    let(:rom) { ROM.env }

    describe "#call" do
      it "creates specified record" do
        expect {
          rom.command(:users).create.call([attributes])
        }.to change {
          rom.relation(:users).all.count
        }.by(+1)
      end

      it "returns a hash?" do
        user = rom.command(:users).create.call([attributes])
        expect(user).to be_a(Hash)
      end

      context "using mapper" do
        it "returns a User" do
          user = rom.command(:users).as(:user).create.call([attributes])
          expect(user).to be_a(User)
        end
      end
    end
  end
end
