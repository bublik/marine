class AddColumnShowOnWizard < ActiveRecord::Migration
  def up
    add_column :certs, :show_on_wizard, :boolean, default: false
  end

  def down
    remove_column :certs, :show_on_wizard
  end
end
