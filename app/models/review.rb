class Review < ActiveRecord::Base
	belongs_to :instructor
	belongs_to :user
end
