class Cert < ActiveRecord::Base
  validates_presence_of :name
  validates_inclusion_of :category, in: ['medical', 'traning', 'documents']

end
