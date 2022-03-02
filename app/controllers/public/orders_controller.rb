class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end
  
  def confirm
  end
  
  def complete
   
  end
  
  def create
    @order=Order.find(params[:id])
    @order.saves
    redirect_to orders_confirm_path
  end
 
  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method)
  end
end
