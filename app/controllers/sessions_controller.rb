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
    message = sign_out_message(current_user)
    session[:current_user_id] = nil
    redirect_to root_url, notice: message
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

  def sign_out_message(user)
    message = "See you next time."
    if user.present?
      message = "Goodbye #{user.given_name}. " + message
    end
    message
  end
end
