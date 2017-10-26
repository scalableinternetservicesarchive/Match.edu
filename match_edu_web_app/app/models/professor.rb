class Professor < ApplicationRecord
	has_many :professor_research_areas
 	has_many :research_areas, :through => :professor_research_areas
    def self.search(search)
        where("name LIKE ? OR school LIKE ? OR department LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
    end
end
