class CreateAgencySubscriptions < ActiveRecord::Migration
  def change
    create_table :agency_subscriptions do |t|
      t.string :email
      t.string :name
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
