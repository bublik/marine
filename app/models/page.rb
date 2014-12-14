# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  title_ru    :string(255)
#  in_menu     :boolean          default(FALSE)
#  position    :integer
#  url         :string(255)
#  description :string(255)
#  keywords    :string(255)
#  content     :text
#  content_ru  :text
#  created_at  :datetime
#  updated_at  :datetime
#  system      :boolean          default(FALSE)
#

class Page < ActiveRecord::Base

  validates :url, presence: true, uniqueness: true
  scope :menu, -> { where(in_menu: true).order(:position) }

  before_save do
    self.url = self.url.split('/').last
  end

  def to_param
    url
  end

  def self.find_page(url_string)
    Page.find_by_url(url_string.split('/').last || 'home')
  end
end
