class Professor < ApplicationRecord
	has_many :professor_research_areas
 	has_many :research_areas, :through => :professor_research_areas
    has_many :professor_student_matches
    has_many :students, :through => :professor_student_matches
    def self.search(search)
    	#Do a search for research areas get relevant ids
    	ids1 = Professor.select('professors.id').joins(professor_research_areas: :research_area).where("research_areas.area LIKE ?", ["%#{search}%"])
    	#Do a search for name, school or department and get relevant ids
    	ids2 = Professor.select('professors.id').where("name LIKE ? OR school LIKE ? OR department LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    	#Combine ids and remove duplicates
    	ids1 = ids1.map{ |item| item.id}
        #researchArea = ResearchArea.where(area: search)
        #professors = researchArea.professors
        #return professors
    	ids2 = ids2.map{ |item| item.id}
    	ids = ids1 + ids2 - (ids1 & ids2)

    	#Major caveat.
    	#The two queries are done and ids are combined and filtered in Memory.
    	#This can be a bottleneck if both these queries return a lot of ids also last query would then be inefficient

    	#We have the relevant ids, now find relevant objects.
    	Professor.where(id: ids)
    end
    
    def self.searchByInterest(search)
        #query directly uses join table
        research_area_id = ResearchArea.where(area: search).pluck(:id)
        professor_ids = ProfessorResearchArea.where(research_area_id: research_area_id).limit(11).pluck(:professor_id)
        Professor.where(id: professor_ids)

        #ids1 = Professor.select('professors.id').joins(professor_research_areas: :research_area).where("research_areas.area like ?", ["%#{search}%"])
        #ids1 = ids1.map{ |item| item.id}
        #Professor.where(id:ids1)
    end

    def self.searchByDepartment(selected_department)
        #Professor.find_by department: selected_department
        professor_ids = Professor.select('professors.id').where("department LIKE ?","%#{selected_department}%")
        professor_ids_map = professor_ids.map{ |item| item.id}
        Professor.where(id:professor_ids_map)
    end
    def self.searchBySchool(selected_school)
        #Professor.find_by school: selected_school
        professor_ids = Professor.select('professors.id').where("school LIKE ?","%#{selected_school}%")
        professor_ids_map = professor_ids.map{ |item| item.id}
        Professor.where(id:professor_ids_map)
    end
end