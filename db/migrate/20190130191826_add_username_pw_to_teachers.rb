class AddUsernamePwToTeachers < ActiveRecord::Migration[5.2]
  def change
	  add_column :teachers, :email, :string, null: false, default: ""
	  add_column :teachers, :password, :string, null: false, default: ""
	  add_column :teachers, :encrypted_password, :string, null: false, default: ""
  end
end
