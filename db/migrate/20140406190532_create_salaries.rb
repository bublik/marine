class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.integer :amount

      t.timestamps
    end

    1.upto(10) do |num|
      Salary.create(amount: 1000 * num)
    end


  end
end
