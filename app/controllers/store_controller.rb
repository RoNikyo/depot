class StoreController < ApplicationController

  def index
    @products = Product.order(:title).page(params[:page]).per(5)
  end
end
