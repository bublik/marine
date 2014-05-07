class UserAddCvUpdatedDate < ActiveRecord::Migration
  def up
    add_column :users, :cv_updated_at, :datetime
  end

  def down
    remove_column :users, :cv_updated_at
  end
end
