class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.references :cert, index: true
      t.references :country, index: true
      t.boolean :is_flag
      t.string :issuer
      t.date :from_date
      t.date :to_date
      t.boolean :is_unlimited
      t.string :licence_number

      t.timestamps
    end
  end
end
