json.extract! student, :id, :first_name, :last_name, :contact, :student_code, :created_at, :updated_at
json.url student_url(student, format: :json)
