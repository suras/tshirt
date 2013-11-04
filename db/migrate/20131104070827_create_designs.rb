class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :name
      t.string :description
      t.boolean :status, :default => true
      t.string :image

      t.timestamps
    end
  end
end
