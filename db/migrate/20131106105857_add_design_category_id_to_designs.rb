class AddDesignCategoryIdToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :design_category_id, :integer
  end
end
