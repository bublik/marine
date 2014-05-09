ActiveAdmin.register VesselCountryCode do
  filter :code
  filter :name

  index :download_links => false do
    selectable_column
    id_column
    column :name
    column :code
    actions
  end

  permit_params :name, :code

end
