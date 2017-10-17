class ProfessorController < ApplicationController
  
  def index
    @professors = Professor.all
  end

  def new
  	@professor = Professor.new
  end

  def create
  	#puts('Create method called..')
  	@professor = Professor.new(professor_params)
  	if @professor.save
  		render html: "Saved successfully"
  	else
  		render html: "Some error"
  	end	
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:name, :email, :picture, :phone, :school, :department)
    end

end
