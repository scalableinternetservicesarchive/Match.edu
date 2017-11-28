class StudentsController < ApplicationController
  
  def show
      @student = Student.find(params[:id])
      @professors = Professor.all
      @research_areas = ResearchArea.all
      @recommend = Professor.searchByInterest(@student.researcharea).order("created_at DESC")
    
      if params[:selected_research_area] != ''
        @recommend = Professor.searchByInterest(params[:selected_research_area]).order("created_at DESC")
      end
      if params[:selected_department] != ''
        @recommend = Professor.searchByDepartment(params[:selected_department]).order("created_at DESC")
      end
      if params[:selected_school] != ''
        @recommend = Professor.searchBySchool(params[:selected_school]).order("created_at DESC")
      end
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

  def edit
    @student = Student.find(params[:id])
    @research_areas = ResearchArea.all
  end

  def update
    @student = Student.find(params[:id])
    #puts(params[:student])
    @student.attributes = user_params_update
    @student.skip_password_validation = true
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Profile was successfully updated' }
      else
        #Rails.logger.info(@student.errors.messages.inspect)
        format.html { redirect_to @student, notice: 'There was some error' }
      end
    end
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

    def user_params_update
         params.require(:student).permit(:name, :email, :researcharea)
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

