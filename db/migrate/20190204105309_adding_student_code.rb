class AddingStudentCode < ActiveRecord::Migration[5.2]
  def change
  	add_index :students, :student_code, unique: true
  end
end
