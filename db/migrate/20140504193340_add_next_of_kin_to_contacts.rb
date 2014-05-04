class AddNextOfKinToContacts < ActiveRecord::Migration
  def up
    add_column :contacts, :next_of_kin, :string
  end

  def down
    remove_column :contacts, :next_of_kin
  end

end
