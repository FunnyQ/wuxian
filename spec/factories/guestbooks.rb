# == Schema Information
#
# Table name: guestbooks
#
#  id         :integer          not null, primary key
#  visitor_id :integer
#  host_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :guestbook do
    visitor_id 1
host_id 1
  end

end
