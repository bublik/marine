class CreateVesselEngines < ActiveRecord::Migration
  def change
    create_table :vessel_engines, force: true do |t|
      t.string :name

      t.timestamps
    end
    drop_table :vessel_engines
  end
end
