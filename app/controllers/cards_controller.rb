class CardsController < ApplicationController
  def create
    @card_form = Cards::CreateForm.build(params[:card])
    @card_form.save
    if @card_form.success?
      redirect_to cards_path, notice: "Card created"
    else
      flash[:alert] = "Invalid card"
      render :new
    end
  end

  def index
    @cards = ROM.env.relation(:cards).all
  end

  def new
    @card_form = Cards::CreateForm.new
  end
end
