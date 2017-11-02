class StudentsController < ApplicationController
  
  def show
      @student = Student.find(params[:id])
  end

  def create
      @student = Student.new(user_params)
      if @student.save
        redirect_to @student
    else
      render 'new'
    end
  end

    def new
        @student = Student.new
  end
     def user_params
         params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

