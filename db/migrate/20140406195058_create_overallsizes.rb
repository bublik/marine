class CreateOverallsizes < ActiveRecord::Migration
  def change
    create_table :overallsizes do |t|
      t.integer :overall_size

      t.timestamps
    end
  end
end
