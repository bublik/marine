class CreateVesselTypes < ActiveRecord::Migration
  def change
    create_table :vessel_types do |t|
      t.string :name

      t.timestamps
    end

    ['Dry Cargo',
     'Pusher Barge',
     'Edible tanker Barge',
     'Tanker',
     'Bunker Barge',
     'Ferry',
     'Sea Dry Cargo',
     'Container Barge',
     'Passenger Barge',
     'Sea Tanker',
     'Tanker Barge',
     'Dry Cargo Barge',
     'Fishing Boat',
     'KVB Barge',
     'Reefer'].each do |name|
      VesselType.create!(name: name)
    end
  end
end
