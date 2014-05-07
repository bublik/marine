class AddUuidToUser < ActiveRecord::Migration

  def up
    add_column :users, :uuid, :string, null: false
  end

  def down
    remove_column :users, :uuid
  end
end
