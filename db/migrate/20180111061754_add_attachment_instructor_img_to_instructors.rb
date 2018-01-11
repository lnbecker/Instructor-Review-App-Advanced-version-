class AddAttachmentInstructorImgToInstructors < ActiveRecord::Migration
  def self.up
    change_table :instructors do |t|
      t.attachment :instructor_img
    end
  end

  def self.down
    remove_attachment :instructors, :instructor_img
  end
end
