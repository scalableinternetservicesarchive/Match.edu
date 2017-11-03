class StudentsController < ApplicationController
  
  def show
      @student = Student.find(params[:id])
      @professors = Professor.all
  end

  def interest
      puts(params[:professor_id])
      puts(params[:student_id])
      match = ProfessorStudentMatch.create!(professor_id: params[:professor_id],student_id: params[:student_id])
      if match
        puts('Success')
      else
        puts('Some error')
      end
      puts("Interest method was called yo!")
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

