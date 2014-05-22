class AddParentReferencesToUsers < ActiveRecord::Migration
  def up
    add_column :users, :parent_id, :integer
    add_index :users, :parent_id
  end

  def down
    remove_column :users, :parent_id, :integer
    drop_index :users, :parent_id
  end

end
