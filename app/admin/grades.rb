ActiveAdmin.register Grade do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :grade

	actions :all, :except => [:destroy, :new, :edit]

	config.filters = false

	index do
	  selectable_column
	  column :id
	  column 'Subject ID',:subject_id
	  column 'Teacher ID', :teacher_id
	  column 'Student ID', :student_id
	  column :marks_obtained
	  column :grade
	  column :created_at
	  column :updated_at
	  actions :defaults => [:update_marks] do |grade|
	    link_to 'Update grade', update_marks_admin_path(id: grade), format: true, defaults: { format: 'html' }
	  end
	end

	controller do
		def update_marks
			@grade_record = Grade.find_by_id(params[:id])
			grade = calculate_grade(@grade_record.marks_obtained)
			@grade_record.update(grade: grade)
			redirect_to admin_grade_index_path
		end

		def calculate_grade(grade)
			if grade.to_i.between?(91,100)
				return 'O'
			elsif grade.to_i.between?(81,90)
				return 'E'
			elsif grade.to_i.between?(71,80)
				return 'A'
			elsif grade.to_i.between?(61,70)
				return 'B'
			elsif grade.to_i.between?(51,60)
				return 'C'
			elsif grade.to_i.between?(41,50)
				return 'D'
			elsif grade.to_i.between?(0,40)
				return 'F'
			end
		end
	end

end