class ReplaceSalaryToRow < ActiveRecord::Migration
  def up
    rename_column :personals, :salary_id, :salary
  end

  def down
    rename_column :personals, :salary, :salary_id
  end

end
