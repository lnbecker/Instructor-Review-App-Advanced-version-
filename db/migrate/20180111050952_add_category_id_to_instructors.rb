class AddCategoryIdToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :category_id, :integer
  end
end
