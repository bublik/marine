ActiveAdmin.register Height do

  filter :height

  index :download_links => false do
    selectable_column
    id_column
    column :height
    actions
  end

  permit_params :height

end
