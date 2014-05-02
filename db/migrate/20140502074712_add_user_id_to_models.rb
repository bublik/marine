class AddUserIdToModels < ActiveRecord::Migration
  def change
    add_column :personals, :user_id, :integer, null: false
    add_column :contacts, :user_id, :integer, null: false
    add_column :certificates, :user_id, :integer, null: false
    add_column :seaservices, :user_id, :integer, null: false
    add_column :langs, :user_id, :integer, null: false
  end

end
