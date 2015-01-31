# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  viewed      :integer
#  photo_count :integer
#  cover_id    :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos, :dependent => :destroy

  accepts_nested_attributes_for :photos

  scope :recent, -> { order("id DESC") }
  scope :hot, -> { order("viewed DESC") }
  scope :get_latest, -> (n) { recent.limit(n) }
  scope :get_hotest, -> (n) { hot.limit(n) }

  def count_up!
    self.viewed += 1
    save
  end
end
