class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :name
      t.string :image
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
