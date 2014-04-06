class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.integer :shoes_size

      t.timestamps
    end

    35.upto(48).each do |size|
      Shoe.create(shoes_size: size)
    end

  end
end
