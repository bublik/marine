class CreateOverallsizes < ActiveRecord::Migration
  def change
    create_table :overallsizes do |t|
      t.integer :overall_size

      t.timestamps
    end

    # simple seed
    [1, 2, 3].each do |num|
      Overallsize.create(overall_size: num)
    end
  end
end
