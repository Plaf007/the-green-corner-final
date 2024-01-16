module SharedFunctionality
  extend ActiveSupport::Concern

  def calculate_total_due(selected_products)
    selected_products.sum { |selected_product| selected_product.quantity.to_i * selected_product.price.to_d }
  end

  def calculate_total_virtual_cash(selected_products)
    selected_products.sum do |selected_product|
      quantity = selected_product.quantity.to_i
      virtual_cash = selected_product.virtual_cash.to_d
      quantity * virtual_cash
    end
  end
end
