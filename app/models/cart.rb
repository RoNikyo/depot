class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by_product_id(product[:product_id])
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product[:product_id])
    end
    current_item
  end

  def total_price
    line_items.sum(&:total_price)

    # line_items.to_a.sum { |line_item| line_item.total_price }

    # counter = 0
    # line_items.to_a.each { |line_item| counter += line_item.total_price }
    # counter
  end

end
