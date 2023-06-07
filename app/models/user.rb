class User < ApplicationRecord
  has_one :cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_reader :password_changed
  def password=(new_password)
    @password_changed = true unless new_password.blank?
    super(new_password)
  end

  after_update_commit :send_password_change_email, if: :password_changed

  private

  def send_password_change_email
    UserMailer.password_changed(self).deliver_now
  end

end
