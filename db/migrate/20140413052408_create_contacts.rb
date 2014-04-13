class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :country, index: true
      t.string :region
      t.string :city
      t.string :street
      t.string :postal_code
      t.string :airport
      t.string :phone
      t.string :mphone
      t.string :email
      t.string :skype

      t.timestamps
    end
  end
end
