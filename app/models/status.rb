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

class Status < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true

  scope :recent, -> { order("created_at DESC") }
  scope :latest, -> { last }
  scope :get_latest, ->(n) { recent.limit(n) }
end
