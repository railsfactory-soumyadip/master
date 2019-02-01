class ChangeContactNumberLimit < ActiveRecord::Migration[5.2]
  def change
  	change_column :students, :contact, :integer, limit: 8
  	change_column :teachers, :contact, :integer, limit: 8
  end
end
