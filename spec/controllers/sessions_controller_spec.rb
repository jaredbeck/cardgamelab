require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  let(:user) { double("Mock User", id: 7) }

  describe "#create" do
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

  describe "#destroy" do
    context "existing user id" do
      let(:id) { user.id }
      let(:user) {
        ROM.env.command(:users).as(:user).create.call([
          {
            email: 'alice@example.com',
            family_name: "Doe",
            given_name: "Alice",
            password_digest: "asdfasdf"
          }
        ])
      }

      it "sets user id in session to nil" do
        session[:current_user_id] = id
        expect {
          delete :destroy, id: id
        }.to change {
          session[:current_user_id]
        }.from(id).to(nil)
      end

      it "includes user name in flash notice" do
        session[:current_user_id] = id
        delete :destroy, id: id
        expect(flash[:notice]).to eq("Goodbye Alice. See you next time.")
      end
    end

    context "non-existent user id" do
      it "sets user id in session to nil" do
        id = 999
        session[:current_user_id] = id
        expect {
          delete :destroy, id: id
        }.to change {
          session[:current_user_id]
        }.from(id).to(nil)
      end

      it "does not include user name in flash notice" do
        delete :destroy, id: 999
        expect(flash[:notice]).to eq("See you next time.")
      end
    end
  end
end
