class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :thing_type
      t.integer :thing_id
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
