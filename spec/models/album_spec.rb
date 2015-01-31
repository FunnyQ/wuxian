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

require 'rails_helper'

RSpec.describe Album, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
