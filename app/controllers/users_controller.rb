class UsersController < ApplicationController
  def create
    @form = Users::CreateForm.build(user_params)
    @form.save
    if @form.success?
      user = @form.result.value
      session[:current_user_id] = user[:id]
      redirect_to users_path, notice: "You're signed up. Welcome!"
    else
      render :new
    end
  end

  def index
    @users = rom.relation(:users).all.map_with(:user)
  end

  def new
    @form = Users::CreateForm.new
  end

  def show
    @user = UserRepository.new(rom).with_cards(params.fetch(:id))
  end

  private

  def user_params
    params.
      require(:user).
      permit(:email, :family_name, :given_name, :password)
  end
end
