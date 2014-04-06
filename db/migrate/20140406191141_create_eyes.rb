class CreateEyes < ActiveRecord::Migration
  def change
    create_table :eyes do |t|
      t.string :name

      t.timestamps
    end

    ['Amber', 'Blue', 'Brown', 'Gray', 'Green', 'Hazel'].each do |color|
      Eye.create(name: color)
    end

  end
end
