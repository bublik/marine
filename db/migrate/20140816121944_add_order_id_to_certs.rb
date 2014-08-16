class AddOrderIdToCerts < ActiveRecord::Migration
  def up
    add_column :certs, :position, :integer, default: 0, blank: false
  end

  def down
    remove_column :certs, :position
  end
end
