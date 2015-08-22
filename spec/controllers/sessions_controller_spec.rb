require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "#create" do
    let(:user) { double("Mock User", id: 7) }

    context "authentication succeeds" do
      before do
        allow(Authenticator).to receive(:new).and_return(
          double("Mock Authenticator", authenticate: user)
        )
      end

      it "sets user id in session" do
        post :create
        expect(session[:current_user_id]).to eq(user.id)
      end

      it "redirects to homepage" do
        post :create
        expect(response).to redirect_to(root_path)
      end
    end

    context "authentication fails" do
      before do
        allow(Authenticator).to receive(:new).and_return(
          double("Mock Authenticator", authenticate: nil)
        )
      end

      it "does not set user id in session" do
        post :create
        expect(session[:current_user_id]).to be_nil
      end

      it "renders the form again" do
        post :create
        expect(response).to render_template(:new)
      end

      it "sets a flash error" do
        post :create
        expect(flash[:alert]).to eq("Incorrect email or password")
      end
    end
  end
end
