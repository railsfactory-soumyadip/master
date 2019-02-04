class StudentsController < ApplicationController

	def index
		@subject = Subject.find_by_id(current_user.subject_id) if current_user.present?
		@students = Student.all
	end

	def edit
		@student = Student.find_by_id(params[:id])
	end

	def update
		subject = Subject.find_by_name(params[:student][:subject])
		grade = Grade.find_by(subject_id: subject.id, student_id: params[:id], teacher_id: current_user.id)
		if grade.present? && grade.marks_obtained.present?
			grade.update(marks_obtained: params[:student][:marks_obtained])
			redirect_to :action => "index", :id => current_user.id
		else
			grade = Grade.new(teacher_id: current_user.id, subject_id: subject.id, student_id: params[:id], marks_obtained: params[:student][:marks_obtained])
			if grade.save! 
				redirect_to :action => "index", :id => current_user.id 
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

