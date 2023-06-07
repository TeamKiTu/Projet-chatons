class CheckoutController < ApplicationController
  protect_from_forgery with: :null_session


  def create

    # @event = Event.find(params['event_id'])
    # session[:event_id] = @event.id

    @total_amount = params[:total_amount].to_f;
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
      success_url: orders_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: orders_cancel_url
    )
   
    redirect_to @session.url, allow_other_host: true
  end


  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    # # Récupérer l'ID de l'évènement depuis la session
    # @event = Event.find(session[:event_id])
    # # Effacer l'ID de l'évènement de la session
    # session.delete(:event_id)
    # # Créer le lien de participation
    # Attendance.create!(stripe_customer_id: params[:session_id], attendee_id: current_user.id, event_id: @event.id)
  end


  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

end
