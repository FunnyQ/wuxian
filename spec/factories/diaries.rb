# == Schema Information
#
# Table name: diaries
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  title        :string(255)
#  content      :text(65535)
#  featured_img :string(255)
#  viewed       :integer          default("1"), not null
#  location     :string(255)
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
