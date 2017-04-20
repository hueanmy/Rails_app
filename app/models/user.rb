class User < ApplicationRecord
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true,
    length: {maximum: Settings.validates.name.length}
  validates :email, presence: true,
    length: {maximum: Settings.validates.email.length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: Settings.validates.email.case_sensitive}
  validates :password, presence: true,
    length: {minimum: Settings.validates.password.length}

  has_secure_password

  private
  def downcase_email
    self.email = self.email.downcase
  end
end
