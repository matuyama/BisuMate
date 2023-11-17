class Public::HomesController < ApplicationController

  def top
    @items = Item.limit(8).order(created_at: :desc)
  end

  def about

  end

end
