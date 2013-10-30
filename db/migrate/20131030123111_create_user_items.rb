class CreateUserItems < ActiveRecord::Migration
  def change
    create_table :user_items do |t|
      t.integer :product_id
      t.integer :user_id
      t.string :image
      t.text :design
      t.string :title
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
