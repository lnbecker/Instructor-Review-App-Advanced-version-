class AddInstructorIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :instructor_id, :integer
  end
end
