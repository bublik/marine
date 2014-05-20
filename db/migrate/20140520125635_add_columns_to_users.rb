class AddColumnsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :phone, :string
    add_column :users, :company_name, :string
    add_column :users, :country_id, :integer
  end

  def down
    remove_column :users, :phone, :string
    remove_column :users, :company_name, :string
    remove_column :users, :country_id, :integer
  end
end
