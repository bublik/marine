class AddLogoToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :logo, :string
  end
end
