class OrdersController < ApplicationController
  protect_from_forgery with: :null_session

  def new
  end

  ######################################## DEF CREATE DU POPUP STRIPE DE PAIEMENT DIRECT SANS REDIRECTION  ######################################## 
  # def create

  #   #____Debut de la phase de paiement____#
  #   @stripe_amount = 500
  #   begin
  #     customer = Stripe::Customer.create({
  #     email: params[:stripeEmail],
  #     source: params[:stripeToken],
  #     })
  #     charge = Stripe::Charge.create({
  #     customer: customer.id,
  #     amount: @stripe_amount,
  #     description: "Achat d'un produit",
  #     currency: 'eur',
  #     })
  #   rescue Stripe::CardError => e
  #     flash[:error] = e.message
  #     redirect_to new_order_path
  #   end
  #   #____Si le rescue a été ignoré, c'est que le paiment a fonctionné____#
  # end

  def create
  end

end