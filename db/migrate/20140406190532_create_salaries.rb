class CreateSalaries < ActiveRecord::Migration
  def change
    drop_table :salaries rescue nil
  end
end
