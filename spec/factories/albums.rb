# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  viewed      :integer
#  photo_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :album do
    title "MyString"
description "MyString"
viewed 1
photo_count 1
  end

end
