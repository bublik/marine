class AddVinvitedByToUsersTable < ActiveRecord::Migration
  def up
    add_column :users, :invited_by, :integer
  end

  def down
    remove_column :users, :invited_by, :integer
  end
end
