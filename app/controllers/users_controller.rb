class UsersController < ApplicationController
  def index
    @users = ROM.env.relation(:users).all.map_with(:user)
  end
end
