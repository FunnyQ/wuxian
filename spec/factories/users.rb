# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  real_name              :string(255)
#  nick_name              :string(255)
#  mobile_phone           :string(255)
#  location               :string(255)
#  level                  :integer          default("1"), not null
#  viewed                 :integer          default("1"), not null
#  is_new_user            :boolean          default("1")
#

FactoryGirl.define do
  factory :user do
    
  end

end
