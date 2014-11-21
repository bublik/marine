class AddVesselEngineFieldToSeaservices < ActiveRecord::Migration
  def up
    add_column :seaservices, :vessel_engine, :string
    remove_column :seaservices, :vessel_engine_id
  end

  def down
    remove_column :seaservices, :vessel_engine
    add_column :seaservices, :vessel_engine_id, :integer
  end
end
