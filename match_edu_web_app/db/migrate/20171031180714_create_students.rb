class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :picture
      t.string :phone
      t.string :school
      t.string :department

      t.timestamps
    end
  end
end
