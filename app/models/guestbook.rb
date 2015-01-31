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

class Guestbook < ActiveRecord::Base
  belongs_to :visitor, class_name: "User"
  belongs_to :host, class_name: "User"

  scope :recent, -> { order("created_at DESC") }
end
