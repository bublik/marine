ActiveAdmin.register User do
  actions :all, except: [:new, :create, :update, :destroy]
  menu priority: 1

  filter :email
  filter :cv_updated_at

  filter :name
  filter :created_at

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :role
    column :cv_updated_at
    column :accept_subscription
    end
end