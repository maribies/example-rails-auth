require 'devise/passwordless/mailer'

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :magic_link_authenticatable

  def password_required?
    # Method from active record
    # Overriding this: https://github.com/abevoelker/devise-passwordless/blob/cb35253fd3cf58a75c087503ff41bea316117b64/lib/devise/models/magic_link_authenticatable.rb#L8
    will_save_change_to_encrypted_password?
  end
end
