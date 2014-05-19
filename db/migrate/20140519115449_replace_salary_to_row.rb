class ReplaceSalaryToRow < ActiveRecord::Migration
  def up
    drop_table :salaries
    rename_column :personals, :salary_id, :salary
  end

  def down
    create_table :salaries
    rename_column :personals, :salary, :salary_id
  end

end
