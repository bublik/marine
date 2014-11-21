class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.integer :amount

      t.timestamps
    end
    drop_table :salaries
  end
end
