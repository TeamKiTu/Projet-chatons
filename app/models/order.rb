class Order < ApplicationRecord
  # after_create :order_confirmation
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def send_confirmation_email
    # OrderMailer.order_confirmation(self.user).deliver_now
  end

end
