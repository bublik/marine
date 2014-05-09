ActiveAdmin.register Country do
  filter :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  permit_params :name

end
