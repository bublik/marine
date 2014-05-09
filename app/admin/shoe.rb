ActiveAdmin.register Shoe do
  filter :shoes_size

  index :download_links => false do
    selectable_column
    id_column
    column :shoes_size
    actions
  end

  permit_params :shoes_size
end
