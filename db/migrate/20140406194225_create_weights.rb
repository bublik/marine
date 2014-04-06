class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :weight

      t.timestamps
    end


    50.upto(140).each do |weight|
      Weight.create(weight: weight)
    end

  end
end
