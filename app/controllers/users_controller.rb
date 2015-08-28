class UsersController < ApplicationController
  def index
    @users = rom.relation(:users).all.map_with(:user)
  end

  def show
    @user = UserRepository.new(rom).with_cards(params.fetch(:id))
  end
end
