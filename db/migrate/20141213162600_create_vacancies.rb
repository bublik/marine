class CreateVacancies < ActiveRecord::Migration
  def up
    create_table :vacancies, force: true do |t|
      t.references :rank, index: true
      t.references :vessel_type, index: true
      t.integer :salary_min
      t.integer :salary_max
      t.string :salary_currency
      t.integer :term_in_month
      t.date :from_date
      t.references :country, index: true
      t.references :language, index: true
      t.string :require_description
      t.string :ship
      t.string :ship_motor
      t.string :nationality
      t.string :region
      t.integer :crew_id
      t.integer :shipowner_country_id

      t.timestamps
    end
  end

  def down
    drop_table :vacancies
  end
end
