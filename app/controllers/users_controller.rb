class UsersController < ApplicationController
  def index
    @users = rom.relation(:users).all.map_with(:user)
  end

  def show
    @user = rom.relation(:users).by_id(params.fetch(:id)).map_with(:user).first
    @cards = rom.relation(:cards).by_user(@user).map_with(:card)
  end
end
