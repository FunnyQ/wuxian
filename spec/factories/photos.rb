# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  file        :string(255)
#  album_id    :integer
#  viewed      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :photo do
    title "MyString"
description "MyText"
album nil
viewed 1
  end

end
