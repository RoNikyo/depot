class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user_visit_counter
  helper_method :reset_user_visit_counter
  helper_method :current_cart

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def user_visit_counter
    session[:counter] = 0 unless session[:counter]
    session[:counter] += 1
  end

  def reset_user_visit_counter
    session[:counter] = 0
  end

end
