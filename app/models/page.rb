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
