class AddSecondImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :second_image, :string
  end
end
