require "rails_helper"

module Cards
  RSpec.describe CreateForm do
    let(:rom) { ROM.env }
    let(:user) {
      rom.command(:users).create.call(
        email: 'alice@example.com',
        family_name: "Doe",
        given_name: "Alice",
        password_digest: "asdfasdf"
      )
    }

    describe "save" do
      context "with a name" do
        it "creates a card" do
          form = described_class.build(name: "Ysera", user_id: user[:id])
          expect { form.save }.to change { rom.relation(:cards).count }.by(+1)
        end
      end

      context "without a name" do
        it "does not create a card" do
          form = described_class.build(name: nil)
          expect { form.save }.to_not change { rom.relation(:cards).count }
        end
      end
    end
  end
end
