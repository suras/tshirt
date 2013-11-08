class AddTitleAndDesignNotesToUserItems < ActiveRecord::Migration
  def change
    add_column :user_items, :design_notes, :text
  end
end
