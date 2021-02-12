class User < ApplicationRecord
  has_secure_password

  has_many :appointments

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
end
