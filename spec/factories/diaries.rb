# == Schema Information
#
# Table name: diaries
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  title        :string
#  content      :text
#  featured_img :string
#  viewed       :integer          default("1"), not null
#  location     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :diary do
    title "MyString"
content "MyText"
featured_img "MyString"
viewed 1
user nil
location "MyString"
  end

end
