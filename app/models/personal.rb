# == Schema Information
#
# Table name: personals
#
#  id               :integer          not null, primary key
#  available_from   :datetime
#  rank_id          :integer
#  surname          :string(255)
#  name             :string(255)
#  middle_name      :string(255)
#  pp_dob           :date
#  pp_pob           :string(255)
#  country_id       :integer
#  citizenship_id   :integer
#  marital_id       :integer
#  sex              :string(255)
#  eye_id           :integer
#  hair_id          :integer
#  height_id        :integer
#  weight_id        :integer
#  overallsize_id   :integer
#  shoe_id          :integer
#  taxation_id_code :string(255)
#  note             :text
#  created_at       :datetime
#  updated_at       :datetime
#

class Personal < ActiveRecord::Base
  belongs_to :user
  belongs_to :rank
  belongs_to :country
  belongs_to :citizenship
  belongs_to :marital
  belongs_to :eye
  belongs_to :hair
  belongs_to :height
  belongs_to :weight
  belongs_to :overallsize
  belongs_to :shoe

  mount_uploader :photo, PhotoUploader

  validates_presence_of :user_id
  validates_inclusion_of :sex, in: %w( m f )
  validates :available_from, :rank_id, :salary, :surname, :name, :pp_dob, :pp_pob, :country_id, :citizenship_id,
            :marital_id, :eye_id, :hair_id, :height_id, :weight_id, :overallsize_id, :shoe_id, presence: true

end
