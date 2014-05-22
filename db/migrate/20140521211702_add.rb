class Add < ActiveRecord::Migration
  def up
    add_column :users, :locked_at, :datetime
    add_column :users, :unlock_token, :string
  end

  def down
    remove_column :users, :locked_at
    remove_column :users, :unlock_token
  end
end
