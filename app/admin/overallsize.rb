ActiveAdmin.register Overallsize do

  filter :overall_size

  index :download_links => false do
    selectable_column
    id_column
    column :overall_size
    actions
  end

  permit_params :overall_size

end
