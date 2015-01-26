class Status < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true

  scope :recent, -> {order("created_at DESC")}
end
