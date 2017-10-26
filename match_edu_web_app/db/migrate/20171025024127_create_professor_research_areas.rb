class CreateProfessorResearchAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :professor_research_areas do |t|
      t.integer :professor_id
      t.integer :research_area_id

      t.timestamps
    end
  end
end
