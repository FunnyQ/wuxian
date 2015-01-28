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

class Diary < ActiveRecord::Base
  belongs_to :user

  mount_uploader :featured_img, DiaryFeaturedUploader

  scope :recent, -> {order("created_at DESC")}
  scope :hot, -> {order("viewed DESC")}
  scope :latest, -> {self.latest}
  scope :get_latest, -> (n) {self.recent.limit(n)}
  scope :get_hotest, -> (n) {self.hot.limit(n)}

  validates_presence_of :title, :content

  def count_up!
    self.viewed += 1
    self.save
  end

end
