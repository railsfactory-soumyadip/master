class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :contact
      t.string :student_code

      t.timestamps
    end
  end
end
