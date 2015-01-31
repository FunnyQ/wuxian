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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # for user status function
  has_many :statuses, dependent: :destroy

  # for oauth authorization
  has_many :authorizations, dependent: :destroy

  # for user diary function
  has_many :diaries, dependent: :destroy

  #for guestbook, a.k.a. who comes my page?
  has_many :guestbooks, :foreign_key => 'host_id', dependent: :destroy
  has_many :visitors , through: :guestbooks

  # album function
  has_many :albums, dependent: :destroy
  has_many :photos, through: :albums

  extend OmniauthCallbacks

  def bind_service(response)
    provider = response["provider"]
    uid = response["uid"]
    authorizations.create(:provider => provider, :uid => uid)
  end

  def count_up!
    self.viewed += 1
    save
  end

  def not_new_user
    self.is_new_user = false
    save
  end

end
