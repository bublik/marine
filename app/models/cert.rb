class Cert < ActiveRecord::Base
  validates_presence_of :name
  validates_inclusion_of :category, in: ['medical', 'traning', 'documents']

  scope :medical, -> { where(category: 'medical')}
  scope :traning, -> { where(category: 'traning')}
  scope :documents, -> { where(category: 'documents')}

end
