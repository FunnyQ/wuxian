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

require 'rails_helper'

RSpec.describe Diary, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
