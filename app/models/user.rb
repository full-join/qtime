# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  # attr_accessor :name, :email, :password, :password_confirmation
  has_secure_password

  # before_save { self.email = email.downcase }
  #
  # validates :name, presence: true
  # validates :username, presence: true
  # EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true
  # validates :password, presence: true
  # validates :password_confirmation, presence: true

end
