require "rails_helper"

RSpec.describe Authenticator do
  let(:rom) { ROM.env }

  describe "#authenticate" do
    let(:email) { 'alice@example.com' }
    let(:password) { "asdfasdf" }

    before do
      rom.command(:users).create.call([
        {
          email: email,
          family_name: "Doe",
          given_name: "Alice",
          password_digest: SCrypt::Password.create(password)
        }
      ])
    end

    context "correct credentials" do
      it "returns a User" do
        authenticator = described_class.new(email, password)
        user = authenticator.authenticate
        expect(user).to be_a(User)
        expect(user.email).to eq(email)
      end
    end

    context "incorrect email" do
      it "returns nil" do
        incorrect_email = "bob@example.com"
        authenticator = described_class.new(incorrect_email, password)
        expect(authenticator.authenticate).to be_nil
      end
    end

    context "incorrect password" do
      it "returns nil" do
        incorrect_password = "fdsafdsa"
        authenticator = described_class.new(email, incorrect_password)
        expect(authenticator.authenticate).to be_nil
      end
    end
  end
end
