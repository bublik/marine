class CreateHairs < ActiveRecord::Migration
  def change
    create_table :hairs do |t|
      t.string :color

      t.timestamps
    end

    ['Black', 'Brown', 'Blond', 'Auburn', 'Chestnut', 'Red', 'White'].each do |name|
      Hair.create(color: name)
    end
  end
end
