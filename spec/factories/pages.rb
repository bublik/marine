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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyString"
    in_menu false
    url "MyString"
    description "MyString"
    keywords "MyString"
    content "MyText"
  end
end
