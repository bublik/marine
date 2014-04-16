class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name

      t.timestamps
    end

    ['Arabic',
     'Bulgarian',
     'Croatian',
     'Czech',
     'Danish',
     'Dutch',
     'English',
     'Estonian',
     'Finish',
     'French',
     'German',
     'Greek',
     'Italian',
     'Latvian',
     'Lithuanian',
     'Norwegian',
     'Polish',
     'Portuguese',
     'Romanian',
     'Russian',
     'Serbian',
     'Slovak',
     'Slovenian',
     'Spanish',
     'Swedish',
     'Turkish',
     'Ukrainian'].each do |name|
      Language.create!(name: name)
    end
  end
end
