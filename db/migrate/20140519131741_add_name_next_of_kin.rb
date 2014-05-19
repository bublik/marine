class AddNameNextOfKin < ActiveRecord::Migration
  def up
    add_column :contacts, :name, :string
  end

  def down
    remove_column :contacts, :name
  end

end
