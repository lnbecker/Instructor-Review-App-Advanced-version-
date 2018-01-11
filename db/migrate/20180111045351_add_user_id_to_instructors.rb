class AddUserIdToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :user_id, :integer
  end
end
