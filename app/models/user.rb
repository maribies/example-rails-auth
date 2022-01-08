require 'devise/passwordless/mailer'

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :magic_link_authenticatable
end
