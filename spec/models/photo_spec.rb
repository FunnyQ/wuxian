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

require 'rails_helper'

RSpec.describe Photo, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
