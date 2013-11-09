class AddColorAndColor1ToUserItems < ActiveRecord::Migration
  def change
    add_column :user_items, :color, :string
    add_column :user_items, :color1, :string
  end
end
