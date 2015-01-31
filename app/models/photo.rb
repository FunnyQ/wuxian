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

class Photo < ActiveRecord::Base
  belongs_to :album

  scope :recent, -> { order("created_at DESC") }
  scope :hot, -> { order("viewed DESC") }
  scope :get_latest, -> (n) { recent.last(n) }
  scope :get_hotest, -> (n) { hot.limit(n) }

  def count_up!
    self.viewed += 1
    save
  end
end
