ActiveAdmin.register Personal do
  filter :available_from
  filter :surname
  filter :name
  filter :taxation_id_code
  filter :pp_dob

  index :download_links => false do
    selectable_column
    id_column
    column :photo do |personal|
      image_tag(personal.photo, width: '100px')
    end
    column :available_from do |personal|
      "Available: #{personal.available_from.to_s(:long)} <br/> Updated: #{personal.updated_at.to_s(:long)}".html_safe
    end
    column 'Surname/family', :surname
    column 'Firstname', :name
    column :middle_name
    column :pp_dob
    #column :pp_pob
    #column 'Sex', :sex
    #column :taxation_id_code
    column 'Comment', :note
    #column :updated_at
    actions
  end

  permit_params :taxation_id_code, :sex, :pp_pob, :middle_name, :name, :surname, :available_from

end
