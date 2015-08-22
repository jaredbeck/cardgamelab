class SessionsController < ApplicationController
  def create
    user = authenticate
    if user.present?
      session[:current_user_id] = user.id
      redirect_to root_url
    else
      flash[:alert] = "Incorrect email or password"
      @session_form = build_form
      render :new
    end
  end

  def destroy
    user = rom.relation(:users).by_id(session[:current_user_id]).
      map_with(:user).first
    session[:current_user_id] = nil
    redirect_to root_url,
      notice: "Goodbye #{user.given_name}. See you next time."
  end

  def new
    @session_form = build_form
  end

  private

  def authenticate
    Authenticator.new(params[:email], params[:password]).authenticate
  end

  def build_form
    SessionForm.new(params[:email], params[:password])
  end
end
