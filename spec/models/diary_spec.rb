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

require 'rails_helper'

RSpec.describe Diary, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
