class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :state
      t.string :city
      t.string :address1
      t.string :address2
      t.string :postal_code
      t.string :contact_number
      t.string :user_id
      t.string :order_id

      t.timestamps
    end
  end
end
