class CreateSeaservices < ActiveRecord::Migration
  def change
    create_table :seaservices do |t|
      t.string :vessel_name
      t.references :vessel_country_code, index: true
      t.string :vessel_year
      t.references :vessel_type, index: true
      t.string :vessel_dwt
      t.references :vessel_engine, index: true
      t.string :vessel_engine_model
      t.integer :vessel_engine_power
      t.references :rank, index: true
      t.date :on_date
      t.date :off_date
      t.string :owner_name
      t.string :agent_name

      t.timestamps
    end
  end
end
