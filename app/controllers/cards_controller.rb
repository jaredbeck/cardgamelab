class CardsController < ApplicationController
  def index
    @cards = ROM.env.relation(:cards).all
  end
end
