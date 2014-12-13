class Remove < ActiveRecord::Migration
  def up
    begin
      drop_table :positions
    rescue
      say('positions table not found')
    end
  end

  def down
    say('Nothing todo.')
  end
end
