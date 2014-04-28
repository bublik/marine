class CreateLangs < ActiveRecord::Migration
  def change
    create_table :langs do |t|
      t.references :language, index: true
      t.string :level

      t.timestamps
    end
  end
end
