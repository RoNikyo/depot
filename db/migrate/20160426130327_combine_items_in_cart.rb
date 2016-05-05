# CombineItemsInCart
class CombineItemsInCart < ActiveRecord::Migration
  def up
    # Заміна кількох записів для одного і того ж товару одним числом.
    Cart.all.each do |cart|
      # підрахунок кожного товару в кошику
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          # видалення окремих записів
          cart.line_items.where(product_id: product_id).delete_all
          # заміна одним записом
          cart.line_items.create(product_id: product_id, quantity: quantity)
        end
      end
    end
  end

  def down
    # розбиття записів з кількістью більше 1 на кілька записів
    LineItem.where("quantity>1").each do |line_item|
      # додавання індивідуальних значень
      line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
      end
      # видалення початкового запису
      line_item.destroy
    end
  end
end
