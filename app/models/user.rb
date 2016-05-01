require 'net/http'
require 'uri'

# User Model
class User < ActiveRecord::Base
  acts_as_voter
  has_secure_password
  has_many :reports, dependent: :destroy
  has_many :answers, dependent: :destroy

  enum authy_status: [:unverified, :onetouch, :sms, :token, :approved, :denied]
  validates :email,  presence: true, format: { with: /\A.+@.+$\Z/ } #, uniqueness: true
  validates :country_code, presence: true #, uniqueness: true
  validates :phone_number, presence: true
end
