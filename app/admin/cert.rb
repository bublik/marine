ActiveAdmin.register Cert do

  index :download_links => false do
    selectable_column
    id_column
    column :name
    column :category
    column :position
    column :show_on_wizard
    actions
  end

  permit_params :name, :category, :position, :show_on_wizard

end
