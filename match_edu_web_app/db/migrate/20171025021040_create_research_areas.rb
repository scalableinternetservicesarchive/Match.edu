class CreateResearchAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :research_areas do |t|
      t.string :area

      t.timestamps
    end
  end
end
