class ReviewsController < ApplicationController

	before_action :find_instructor
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)

		#associate review with current book and user
		@review.instructor_id = @instructor.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to instructor_path(@instructor)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to instructor_path(@instructor)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to instructor_path(@instructor)
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_instructor
			@instructor = Instructor.find(params[:instructor_id])
		end

		def find_review
			#find review
			@review = Review.find(params[:id])
		end
end
