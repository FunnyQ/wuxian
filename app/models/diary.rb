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

class Diary < ActiveRecord::Base
  belongs_to :user

  mount_uploader :featured_img, DiaryFeaturedUploader

  scope :recent, -> { order("created_at DESC") }
  scope :hot, -> { order("viewed DESC") }
  scope :latest, -> { last }
  scope :get_latest, -> (n) { recent.last(n) }
  scope :get_hotest, -> (n) { hot.limit(n) }

  validates_presence_of :title, :content

  def count_up!
    self.viewed += 1
    save
  end

end
