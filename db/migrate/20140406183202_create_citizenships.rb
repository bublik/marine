class CreateCitizenships < ActiveRecord::Migration
  def change
    create_table :citizenships do |t|
      t.string :name

      t.timestamps
    end

    ['Citizen','Alien','Non citizen','Stateless'].each do |name|
      Citizenship.create(name: name)
    end

  end
end
