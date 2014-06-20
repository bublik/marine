class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :payment_type
      t.integer :uid
      t.integer :send_status, default: 0
      t.integer :payment_status, default: 0

      t.timestamps
    end
  end
end
