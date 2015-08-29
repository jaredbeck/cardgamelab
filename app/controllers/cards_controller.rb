class CardsController < ApplicationController
  def create
    @card_form = Cards::CreateForm.build(card_params)
    @card_form.save
    if @card_form.success?
      card = @card_form.result.value
      redirect_to user_path(card[:user_id]), notice: "Card created"
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

  private

  def card_params
    params.require(:card).permit(:name).merge(user_id: current_user.id)
  end
end
