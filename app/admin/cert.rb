ActiveAdmin.register Cert do

  index :download_links => false do
    selectable_column
    id_column
    column :name
    column :category
    actions
  end

  permit_params :name, :category

end
