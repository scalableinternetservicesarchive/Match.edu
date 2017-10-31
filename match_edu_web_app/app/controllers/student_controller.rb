class StudentController < ApplicationController
  def index
    @students = Student.all
  end

  def new
  	@student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
  	#puts('Create method called..')
  	@student = Student.new(student_params)
  	respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Profile was successfully created.' }
        #format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        #format.json { render json: @Student.errors, status: :unprocessable_entity }
      end
    end	
  end

  def update
    #puts('Update method called..')
    @student = Student.find(params[:id])
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Profile was successfully created.' }
        #format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        #format.json { render json: @Student.errors, status: :unprocessable_entity }
      end
    end 
  end

  private

	# Never trust parameters from the scary internet, only allow the white list through.
	def student_params
	  params.require(:student).permit(:name, :email, :picture, :phone, :school, :department)
	end

end
