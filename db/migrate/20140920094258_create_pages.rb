class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :title_ru
      t.boolean :in_menu, default: false
      t.integer :position
      t.string :url
      t.string :description
      t.string :keywords
      t.text :content
      t.text :content_ru

      t.timestamps
    end

    add_index :pages, :url, unique: true
  end
end
