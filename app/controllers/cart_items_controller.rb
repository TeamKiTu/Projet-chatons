class CartItemsController < ApplicationController

  def create
    @card_item = CartItem.add_cart_item_link(permit_link_params)
      redirect_to items_path
  end

  def update
  end

  def destroy
    @item_delete = CartItem.find(params[:id])
    @item_delete.destroy
    redirect_to cart_path(current_user.cart.id)
  end

  private

  def permit_link_params
    params.require(:cart_item).permit(:item_id, :cart_id)
  end

end
