ActiveAdmin.register Teacher do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :first_name, :last_name, :contact, :subject_id, :email, :password, :encrypted_password

  before_create do |teacher|
    subject_id = Subject.find_by_name(teacher.subject_id).id
    teacher.subject_id = subject_id if subject_id.present?
  end

index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :contact
    column :subject_id
    column :email
    actions
  end

form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :contact
      f.input :subject_id
      f.input :email
      f.input :password
    end
    f.actions
  end

end
