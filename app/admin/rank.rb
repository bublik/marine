ActiveAdmin.register Rank do

  filter :name

  index :download_links => false do
    selectable_column
    id_column
    column :name
    actions
  end
  permit_params :name

end
