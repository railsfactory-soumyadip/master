class StudentsController < InheritedResources::Base

	def index
		teacher = Teacher.find_by_id(params[:id])
		@subject = Subject.find_by_id(teacher.subject_id) if teacher.present?
		@students = Student.all
	end

	def update
		subject = Subject.find_by_name(params[:student][:subject])
		teacher = Teacher.find_by_subject_id(subject.id)
		binding.pry
		grade = Grade.find_by(subject_id: subject.id, student_id: params[:id], teacher_id: teacher.id)
		if grade.present? && grade.marks_obtained.present?
			grade.update(marks_obtained: params[:student][:marks_obtained])
			redirect_to :action => "index", :id => teacher.id
		else
			grade = Grade.new(teacher_id: teacher.id, subject_id: subject.id, student_id: params[:id], marks_obtained: params[:student][:marks_obtained])
			# grade.update(marks_obtained: params[:student][:marks_obtained])
			if grade.save! 
				redirect_to :action => "index", :id => teacher.id 
			else
				return grade.errors
			end
		end
	end

  private

    def student_params
      params.require(:student).permit(:first_name, :last_name, :contact, :student_code)
    end
end

