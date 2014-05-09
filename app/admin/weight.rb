ActiveAdmin.register Weight do

  filter :weight

  index :download_links => false do
    selectable_column
    id_column
    column :weight
    actions
  end

  permit_params :weight

end
