class Instructor < ActiveRecord::Base

	#adds associations to instructors
	belongs_to :user
	belongs_to :category
	has_many :reviews

	#for instructor images
	has_attached_file :instructor_img, styles: { instructor_index: "250x350>", instructor_show: "325x475>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :instructor_img, content_type: /\Aimage\/.*\z/
end
