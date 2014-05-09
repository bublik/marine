ActiveAdmin.register Hair do

  filter :color

  index :download_links => false do
    selectable_column
    id_column
    column :color
    actions
  end

  permit_params :color

end
