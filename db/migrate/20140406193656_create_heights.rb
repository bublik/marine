class CreateHeights < ActiveRecord::Migration
  def change
    create_table :heights do |t|
      t.integer :height

      t.timestamps
    end

    150.upto(220).each do |height|
      Height.create(height: height)
    end
  end
end
