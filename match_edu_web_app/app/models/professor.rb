class Professor < ApplicationRecord
	has_many :professor_research_areas
 	has_many :research_areas, :through => :professor_research_areas
end
