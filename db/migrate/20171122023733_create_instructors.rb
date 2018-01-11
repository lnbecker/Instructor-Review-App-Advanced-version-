class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.text :description
      t.string :class

      t.timestamps null: false
    end
  end
end
