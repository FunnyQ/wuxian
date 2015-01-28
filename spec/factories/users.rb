# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  real_name              :string
#  nick_name              :string
#  mobile_phone           :string
#  location               :string
#  level                  :integer          default("1"), not null
#  viewed                 :integer          default("1"), not null
#

FactoryGirl.define do
  factory :user do
    
  end

end
