class Professor < ApplicationRecord
	has_many :professor_research_areas
 	has_many :research_areas, :through => :professor_research_areas
    has_many :professor_student_matches
    has_many :students, :through => :professor_student_matches
    def self.search(search)
    	Professor.find_by_sql("SELECT * FROM professors WHERE name LIKE '%#{search}%' OR school LIKE '%#{search}%' OR department LIKE '%#{search}%' OR id IN (SELECT professor_research_areas.professor_id from professor_research_areas inner join research_areas on
research_areas.id = professor_research_areas.research_area_id where research_areas.area LIKE '%#{search}%' LIMIT 10) LIMIT 10")
    end
    
    def self.searchByInterest(search)
        ids1 = Professor.select('professors.id').joins(professor_research_areas: :research_area).where("research_areas.area like ?", ["%#{search}%"])
        ids1 = ids1.map{ |item| item.id}
        Professor.where(id:ids1)
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