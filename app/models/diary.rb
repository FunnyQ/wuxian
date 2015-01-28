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
end
