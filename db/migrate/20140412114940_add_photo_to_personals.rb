class AddPhotoToPersonals < ActiveRecord::Migration
  def change
    add_column :personals, :photo, :string
  end
end
