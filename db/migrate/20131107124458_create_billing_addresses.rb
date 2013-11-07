class CreateBillingAddresses < ActiveRecord::Migration
  def change
    create_table :billing_addresses do |t|
      t.integer :user_id
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
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
