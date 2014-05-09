ActiveAdmin.register Salary do
  filter :amount

  index :download_links => false do
    selectable_column
    id_column
    column :amount
    actions
  end
  permit_params :amount

end
