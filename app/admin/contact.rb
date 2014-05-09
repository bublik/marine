ActiveAdmin.register Contact do
  actions :all, except: [:new, :update, :destroy]
  menu priority: 2
  filter :country
  filter :region
  filter :phone
  filter :mphone
  filter :email
  filter :skype
  filter :next_of_kin

  index :download_links => false do
    selectable_column
    id_column
    column :email
    column :mphone
    column :phone
    column :skype

    column :region
    column :city
    column :next_of_kin
    actions
  end

end
