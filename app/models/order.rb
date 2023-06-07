class Order < ApplicationRecord
  after_create :confirmation_order
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def send_confirmation_email
    OrderMailer.confirmation_order(self.user).deliver_now
  end

end
