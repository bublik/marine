class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.datetime :available_from
      t.references :salary, index: true
      t.references :rank, index: true
      t.string :surname
      t.string :name
      t.string :middle_name
      t.date :pp_dob
      t.string :pp_pob
      t.references :country, index: true
      t.references :citizenship, index: true
      t.references :marital, index: true
      t.string :sex
      t.references :eye, index: true
      t.references :hair, index: true
      t.references :height, index: true
      t.references :weight, index: true
      t.references :overallsize, index: true
      t.references :shoe, index: true
      t.string :taxation_id_code
      t.text :note

      t.timestamps
    end
  end
end
