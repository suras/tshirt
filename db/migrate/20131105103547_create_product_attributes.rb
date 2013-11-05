class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.integer :product_id
      t.string :attribute_name
      t.integer :price
      t.string :currency
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
