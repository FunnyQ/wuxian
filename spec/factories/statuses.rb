# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :status do
    content "MyText"
user nil
  end

end
