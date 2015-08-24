require "rails_helper"

module Cards
  RSpec.describe CreateForm do
    let(:rom) { ROM.env }

    describe "save" do
      context "with a name" do
        it "creates a card" do
          form = described_class.build(name: "Ysera")
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
