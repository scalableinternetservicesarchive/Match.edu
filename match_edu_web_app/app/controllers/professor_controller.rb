class ProfessorController < ApplicationController
  
  def index
    @professors = Professor.all
    @research_areas = ResearchArea.all
    if params[:search]
        @professors = Professor.search(params[:search]).order("created_at DESC")
    else
        @professor = Professor.all.order("created_at DESC")
  end
  end

  def new
  	@professor = Professor.new
  end

  def show
    @professor = Professor.find(params[:id])
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def create
  	#puts('Create method called..')
  	@professor = Professor.new(professor_params)
  	respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Profile was successfully created.' }
        #format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        #format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end	
  end

  def update
    #puts('Update method called..')
    @professor = Professor.find(params[:id])
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: 'Profile was successfully created.' }
        #format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        #format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end 
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:name, :email, :picture, :phone, :school, :department)
    end

end
