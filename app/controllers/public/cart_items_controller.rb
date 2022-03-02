class Public::CartItemsController < ApplicationController
  def index
   @items=Item.all
   @cart_items= CartItem.all
    # カートに入ってる商品の合計金額
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if  @cart_item
      @cart_item.amount += params[:cart_item][:amount].to_i
    else
      @cart_item = CartItem.new(cart_item_params)
    end
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def update
   @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
   @cart_item.update(cart_item_params)
   render desrtroy
  end

  def destroy
   @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
   @cart_item.destroy(cart_item_params)
   redirect_to cart_items_path
  end

  def destroy_all
   @cart_item = current_customer.cart_items.find(params[:id])
   @cart_item.destroy
   redirect_to cart_items_path
  end

  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
