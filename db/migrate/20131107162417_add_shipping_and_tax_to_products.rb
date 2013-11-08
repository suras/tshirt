class AddShippingAndTaxToProducts < ActiveRecord::Migration
  def change
    add_column :products, :shipping_and_handling, :integer
    add_column :products, :tax, :integer
  end
end
