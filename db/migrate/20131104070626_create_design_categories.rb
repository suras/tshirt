class CreateDesignCategories < ActiveRecord::Migration
  def change
    create_table :design_categories do |t|
      t.string :name
      t.string :description
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
