# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
#puts 'DEFAULT USERS'
#user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
#puts 'user: ' << user.name
#user.confirm!

personal_rank_pplied_for = ['Stuurman Rhein',
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
                            'Trainee matroos')

personal_rank_pplied_for.each do |rank_name|
  Rank.create(name: rank_name)
end