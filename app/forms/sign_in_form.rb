# frozen_string_literal: true

class SignInForm < Reform::Form
  property :email
  property :password

  validates :email, presence: true
  validates :password, presence: true
  validate :user_exists, :user_can_sign_in

  def user_can_sign_in
    errors.add(:password, :cannot_sign_in) if password.present? && !user&.authenticate(password)
  end

  def user_exists
    errors.add(:email, :user_does_not_exist) if email.present? && !user
  end

  def user
    @user ||= User.find_by(email: email)
  end

  def email=(value)
    super(value.downcase)
  end
end
