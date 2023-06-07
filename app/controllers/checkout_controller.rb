class CheckoutController < ApplicationController

  def create
    @orders = Item.find(params[:orders])
    session[:orders] = @orders

    @total_amount = params[:total_amount].to_d;
    session[:total_amount] = @total_amount

    @cart_id = current_user.cart.id
    session[:cart_id] = @cart_id



    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total_amount*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
   
    redirect_to @session.url, allow_other_host: true
  end


  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    # Récupérer l'ID de l'évènement depuis la session
    puts "*"*100
    puts session[:orders]
    puts session[:total_amount]
    puts session[:cart_id]
    puts "laalalalalalaall"
    puts "*"*100
    
    
    
    # Effacer l'ID de l'évènement de la session
    session.delete(:orders)
    session.delete(:total_amount)
    session.delete(:cart_id)
    # # Créer le lien de participation
    # Attendance.create!(stripe_customer_id: params[:session_id], attendee_id: current_user.id, event_id: @event.id)
  end


  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

end
