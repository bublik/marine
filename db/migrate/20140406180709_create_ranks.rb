class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :name

      t.timestamps
    end

    ['Stuurman Rhein',
     'Volmatroos Rhein',
     'Matroos Rhein',
     'Licht matroos Rhein',
     'Decksman Rhein',
     'Bootsman',
     'All positions on the sea ship',
     'Engineer Rheincruises',
     'Cabin Stewardess',
     'Matroos Rheincruises',
     '2nd Engineer Ferry',
     '1st Engineer Ferry',
     'Matroos Seagoing',
     'Engineer 1st Seagoing',
     'Engineer 2nd seagoing',
     'Decksman Rhein / Matroos outsite R',
     'Restaurant Bar staff',
     'Engineer 3rd seagoing',
     'Trainee matroos'].each do |rank_name|
      Rank.create(name: rank_name)
    end

  end
end
