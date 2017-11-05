class CreateProfessorStudentMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :professor_student_matches do |t|
      t.integer :professor_id
      t.integer :student_id
      t.boolean :match

      t.timestamps
    end
  end
end
