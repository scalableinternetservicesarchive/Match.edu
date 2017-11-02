# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Professor.destroy_all
ResearchArea.destroy_all
p "Cleared existing professor profiles"
p "Cleared existing research areas"

list_research_areas = ["Distributed Systems",
						"Parallel Computing","Scalable Systems", 
						"Networking", "Computer Security",
            "Theoretical Computer Science",
            "Cloud Computing", "Machine Learning",
            "Operating Systems", "Artificial Intelligence"
          ]
research_areas = (0..9).to_a.map do |n|
  ResearchArea.create!(area: list_research_areas[n]) 
end

100.times do |index|
  professor = Professor.create!(name: Faker::Name.unique.name,
                email: Faker::Internet.unique.email,
                picture: "https://graydon.law/wp-content/themes/graydon/images/gravatar_default_550.jpg",
                phone: Faker::PhoneNumber.cell_phone,
                school: Faker::University.name,
                department: Faker::Job.field)
  student = Student.create!(name: Faker::Name.unique.name,
                email: Faker::Internet.unique.email,
                password: "password",
                password_confirmation: "password")


  professor.professor_research_areas.create(
  research_area: research_areas[rand(research_areas.size)]  
)
end	



 
p "Created #{Professor.count} professor profiles"
p "Created #{ResearchArea.count} research areas"
