class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.boolean :status
      t.date :valid_to

      t.timestamps
    end
  end
end
