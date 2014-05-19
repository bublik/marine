class AddVesselEngineFieldToSeaservices < ActiveRecord::Migration
  def up
    add_column :seaservices, :vessel_engine, :string
    remove_column :seaservices, :vessel_engine_id
    drop_table :vessel_engines
  end

  def down
    create_table :vessel_engines
    remove_column :seaservices, :vessel_engine, :string
    add_column :seaservices, :vessel_engine_id, :integer
  end
end
