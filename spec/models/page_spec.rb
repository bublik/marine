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

require 'spec_helper'

describe Page do
  pending "add some examples to (or delete) #{__FILE__}"
end
