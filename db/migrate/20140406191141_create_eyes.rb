class CreateEyes < ActiveRecord::Migration
  def change
    create_table :eyes do |t|
      t.string :name

      t.timestamps
    end
  end
end
