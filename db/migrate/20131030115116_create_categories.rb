class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :image
      t.string :name
      t.string :description
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
