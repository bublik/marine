class AddRequiredPositionToPersonal < ActiveRecord::Migration
  def up
    add_column :personals, :required_position, :string
  end
  def down
    remove_column :personals, :required_position
  end
end
