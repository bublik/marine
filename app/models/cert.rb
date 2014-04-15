class Cert < ActiveRecord::Base
  CATEGORIES = ['documents', 'medical', 'traning']

  validates_presence_of :name
  validates_inclusion_of :category, in: Cert::CATEGORIES

  scope :medical, -> { where(category: 'medical') }
  scope :traning, -> { where(category: 'traning') }
  scope :documents, -> { where(category: 'documents') }
  scope :by_category, ->(category) { where(category: category) }

end
