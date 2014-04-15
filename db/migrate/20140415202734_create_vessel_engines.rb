class CreateVesselEngines < ActiveRecord::Migration
  def change
    create_table :vessel_engines do |t|
      t.string :name

      t.timestamps
    end

    ['B&amp;W',
     'MAN',
     'MAK',
     'Wartsila',
     'Sulzer',
     'Mitsubishi',
     'Pilstick',
     'Deutz',
     'Other',
     'Akasaka',
     '6NVD',
     'KOBE DIESEL',
     'CATERPILLER',
     'YANMAR',
     'VOLVO',
     'STORK',
     'POTAR',
     'RD',
     'GMT',
     'Hyundai',
     'Hanshin',
     'MIRRLEES BLACKSTONE',
     'Cummins',
     '8NVD',
     'Ulstein Aquamaster',
     'BERGEN',
     'Ulstein Bergen',
     'Industrie',
     'DC Electro Motor',
     'ABC',
     'MAN-B&amp;W',
     'Niigata',
     'MDDCF-5935846',
     'KTA 50 M2 (HX)',
     'CAT-3306',
     'D12D-C MH',
     'CAT-3412E',
     'KTA 19-M4',
     'C 32',
     'MWM',
     'BW-ALPHA',
     'Blackstone',
     'Alpha',
     'BOLNES',
     'Callesen',
     'Daihatsu',
     'Rolls-Royce',
     'EMD',
     'CAT',
     'MACH',
     'KUMERA',
     'unknown',
     'MWM TBD440-06'].each do |name|
      VesselEngine.create!(name: name)
    end
  end
end
