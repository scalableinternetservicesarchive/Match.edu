# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Professor.destroy_all
ResearchArea.destroy_all
Student.destroy_all
ProfessorResearchArea.destroy_all
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

#Bulk insert professor data
values = (0..1000).to_a.map {|u| 
  "('"+Faker::Name.name.gsub(/\W/, ' ')+"','"+
  Faker::Internet.email+"',"+
  "'https://graydon.law/wp-content/themes/graydon/images/gravatar_default_550.jpg','"+
  Faker::PhoneNumber.cell_phone+"','"+
  Faker::University.name.gsub(/\W/, ' ')+"','"+
  Faker::Job.field+"','"+
  Time.now.utc.to_s(:db)+"','"+
  Time.now.utc.to_s(:db)+"'"+
  ")"}.join(",")

ActiveRecord::Base.connection.execute("INSERT INTO professors (name, email, picture, phone, school, department, created_at, updated_at) VALUES #{values}")

#Bulk insert student data
values = (0..1000).to_a.map {|u| 
  "('"+Faker::Name.name.gsub(/\W/, ' ')+"','"+
  Faker::Internet.email+"','"+
  list_research_areas[u%10]+"','"+
  Time.now.utc.to_s(:db)+"','"+
  Time.now.utc.to_s(:db)+"'"+
  ")"}.join(",")

ActiveRecord::Base.connection.execute("INSERT INTO students (name, email, researcharea, created_at, updated_at) VALUES #{values}")

values = (0..1000).to_a.map {|u|
  "("+u.to_s+","+
  rand(research_areas.size).to_s+",'"+
  Time.now.utc.to_s(:db)+"','"+
  Time.now.utc.to_s(:db)+"'"+
  ")"}.join(",")


ActiveRecord::Base.connection.execute("INSERT INTO professor_research_areas (professor_id, research_area_id, created_at, updated_at) VALUES #{values}")

p "Created #{Professor.count} professor profiles"
p "Created #{Student.count} student profiles"