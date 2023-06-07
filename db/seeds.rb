require 'faker'

User.destroy_all
Item.destroy_all
Order.destroy_all
OrderItem.destroy_all
CartItem.destroy_all


10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: "%.2f"%rand(0.0..100.0),
    image_url: "https://loremflickr.com/#{rand(290..300)}/#{rand(290..300)}/kitten"
  )
end


10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  Cart.create(user_id: user.id)
end



Cart.all.each do |cart|
  rand(1..5).times do
    item = Item.all.sample
    CartItem.create(cart_id: cart.id, item_id: item.id)
  end
end


# 10.times do
#   user = User.all.sample
#   order = Order.create(user_id: user.id)
#   rand(1..5).times do
#     item = Item.all.sample
#     OrderItem.create(order_id: order.id, item_id: item.id)
#   end
# end
