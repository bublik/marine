class AddCrewReferenceToUsers < ActiveRecord::Migration
  def up
    add_column :users, :crew_id, :integer
  end

  def down
    remove_column :users, :crew_id
  end
end
