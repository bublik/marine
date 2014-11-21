# == Schema Information
#
# Table name: certs
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  category       :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  show_on_wizard :boolean          default(FALSE)
#

class Cert < ActiveRecord::Base
  CATEGORIES = ['documents', 'medical', 'traning']

  validates_presence_of :name
  validates_inclusion_of :category, in: Cert::CATEGORIES
  default_scope {order(:position)}
  scope :medical, -> { where(category: 'medical') }
  scope :traning, -> { where(category: 'traning') }
  scope :documents, -> { where(category: 'documents') }
  scope :by_category, ->(category) { where(category: category) }
  scope :show_on_wizard, -> (plus_ids) { where('certs.show_on_wizard = true OR certs.id IN (?)', plus_ids) }

  before_create do
    self.position = Cert.maximum(:position).to_i + 1
  end

end
