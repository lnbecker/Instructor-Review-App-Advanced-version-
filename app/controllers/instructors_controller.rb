class InstructorsController < ApplicationController

	before_action :find_instructor, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	def index
		#filtering
		if params[:category].blank?
			#gets all instructors in order of creation
			@instructors = Instructor.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@instructors = Instructor.where(:category_id => @category_id).order("created_at DESC")
		end
	end

	def show
		if @instructor.reviews.blank?
			@average_review = 0
		else
			@average_review = @instructor.reviews.average(:rating).round(2)
		end
	end

	def new
		#makes instructor independent of user
		#@instructor = Instructor.new

		#makes instructor connected to user
		@instructor = current_user.instructors.build

		#access categories (class formats) when creating a new instructor
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		#below makes no connection to user
		#@instructor = Instructor.new(instructor_params)

		#connects instructor to user
		@instructor = current_user.instructors.build(instructor_params)
		#associate it with selected format id
		@instructor.category_id = params[:category_id]

		if @instructor.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		#access categories (class formats) when creating a new instructor
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		#associate it with selected format id
		@instructor.category_id = params[:category_id]

		if @instructor.update(instructor_params)
			redirect_to instructor_path(@instructor)
		else
			render 'edit'
		end
	end

	def destroy
		@instructor.destroy
		redirect_to root_path
	end

	private

		def instructor_params
			params.require(:instructor).permit(:name, :description, :format, :category_id, :instructor_img)
		end

		def find_instructor
			@instructor = Instructor.find(params[ :id])
		end
end
