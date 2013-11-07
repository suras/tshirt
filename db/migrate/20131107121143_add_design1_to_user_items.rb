class AddDesign1ToUserItems < ActiveRecord::Migration
  def change
    add_column :user_items, :design1, :text
    add_column :user_items, :image1, :string
  end
end
