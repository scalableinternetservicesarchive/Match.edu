class StudentsController < ApplicationController
  
  def show
      @student = Student.find(params[:id])
      @professors = Professor.all
      @research_areas = ResearchArea.all
      @recommend = Professor.searchByInterest(@student.researcharea).order("created_at DESC")
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
          log_in @student
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @student
    else
      render 'new'
    end
  end

    def new
        @student = Student.new
  end
     def user_params
         params.require(:student).permit(:name, :email, :researcharea,:password,
                                   :password_confirmation)
    end

    def recommendations
      @professors = Professor.all
      @research_areas = ResearchArea.all
      if params[:search]
          @professors = Professor.search(params[:search]).order("created_at DESC")
      else
          @professor = Professor.all.order("created_at DESC")
      end
    end
  end

