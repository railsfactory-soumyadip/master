class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :subject_id
      t.integer :teacher_id
      t.integer :student_id
      t.integer :marks_obtained
      t.string :grade

      t.timestamps
    end
  end
end
