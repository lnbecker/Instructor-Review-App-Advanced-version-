class RenameColumnXinTableYtoZ < ActiveRecord::Migration
  def change
  	rename_column :instructors, :class, :format
  end
end
