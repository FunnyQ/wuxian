# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  album_id    :integer
#  viewed      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Photo < ActiveRecord::Base
  belongs_to :album
end
