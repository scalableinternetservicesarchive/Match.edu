class ProfessorStudentMatch < ApplicationRecord
	belongs_to :professor
 	belongs_to :student
end
