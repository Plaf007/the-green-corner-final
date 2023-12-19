module SharedFunctionality
  extend ActiveSupport::Concern

  def calculate_total_due(selected_products)
    selected_products.sum { |selected_product| selected_product.quantity * selected_product.price }
  end

  def calculate_total_virtual_cash(selected_products)
    selected_products.sum { |selected_product| selected_product.quantity * selected_product.virtual_cash }
  end
end
