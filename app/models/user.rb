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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :statuses, dependent: :destroy
  has_many :authorizations, dependent: :destroy
  has_many :diaries, dependent: :destroy

  extend OmniauthCallbacks

  def bind_service(response)
    provider = response["provider"]
    uid = response["uid"]
    authorizations.create(:provider => provider , :uid => uid )
  end

  def count_up!
    self.viewed += 1
    self.save
  end

  def not_new_user
    self.is_new_user = false
    self.save
  end

end
