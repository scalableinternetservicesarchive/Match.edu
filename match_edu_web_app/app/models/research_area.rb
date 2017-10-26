class ResearchArea < ApplicationRecord
	has_many :professor_research_areas
 	has_many :professors, :through => :professor_research_areas
end
