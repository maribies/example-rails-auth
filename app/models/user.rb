require 'devise/passwordless/mailer'

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :magic_link_authenticatable

  before_validation :username_already_exists?
  before_create :add_random_username

  def password_required?
    # Method from active record
    # Overriding this: https://github.com/abevoelker/devise-passwordless/blob/cb35253fd3cf58a75c087503ff41bea316117b64/lib/devise/models/magic_link_authenticatable.rb#L8
    will_save_change_to_encrypted_password?
  end

  def current_username?
    username.present? && user_by_username(username) == self
  end

  def unique_username?
    username.present? && !user_by_username(username)
  end

  def unique_username_present?
    current_username? || unique_username?
  end

  def username_already_exists?
    return if username == self.username
    raise 'Username already exists' if unique_username_present? && user_by_username(username)
    self.username = username
  end

  def user_by_username(username)
    @user_by_username ||= User.find_by(username: username)
  end

  def add_random_username
    return if unique_username_present?
    random_username = generate_username
    random_username = generate_username while user_by_username(random_username)

    self.username = random_username
  end

  def generate_username
    # Not entirely sure what we really want
    SecureRandom.rand(10000..99999)
  end
end
