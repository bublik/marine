class AddVerifyAtToAgency < ActiveRecord::Migration
  def up
    add_column :users, :verify_at, :datetime
  end

  def down
    remove_column :users, :verify_at
  end

end
