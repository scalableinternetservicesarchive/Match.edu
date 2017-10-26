class ProfessorResearch < ApplicationRecord
	belongs_to :professor
 	belongs_to :research_area
end
