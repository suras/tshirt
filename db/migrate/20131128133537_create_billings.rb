class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.string :country
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone
      t.string :order_id

      t.timestamps
    end
  end
end
