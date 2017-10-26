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

100.times do |index|
  Professor.create!(name: Faker::Name.unique.name,
                email: Faker::Internet.unique.email,
                picture: "https://graydon.law/wp-content/themes/graydon/images/gravatar_default_550.jpg",
                phone: Faker::PhoneNumber.cell_phone,
                school: Faker::University.name,
                department: Faker::Job.field) 
end

10.times do |index|
  ResearchArea.create!(area: Faker::ProgrammingLanguage.unique.name) 
end

 
p "Created #{Professor.count} professor profiles"
p "Created #{ResearchArea.count} research areas"
