class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end
  
  def confirm
    @total=0
    @cart_items=CartItem.all
    @order = Order.new(order_params)
    if params[:order][:select_address] == "my_address"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "old_address"
     address = Address.find(params[:order][:address_id])
     @order.postal_code = address.postal_code
     @order.address = address.address
     @order.name = address.name
    elsif params[:order][:select_address] == "new_address"
     
    end
  end
  
  def complete
  end
  
  def create
    @order=Order.new(order_params)
    @order.save
    @cart_items=current_customer.cart_items
    @cart_items.each do |cart_item|
    @order_details=OrderDetail.new
    @order_details.item_id=cart_item.item_id
    @order_details.order_id=@order.id
    @order_details.amount=cart_item.amount
    @order_details.price=cart_item.item.price * 1.1
    @order_details.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end
 
  def index
    @order=current_customer.orders
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method)
  end
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
