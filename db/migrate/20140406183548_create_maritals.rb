class CreateMaritals < ActiveRecord::Migration
  def change
    create_table :maritals do |t|
      t.string :name

      t.timestamps
    end


    ['Single', 'Married', 'Divorced', 'Common Law Partner', 'Widowed', 'Separated', 'Unknown'].each do |name|
      Marital.create(name: name)
    end

  end
end
