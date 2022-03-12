class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @Order.update(order_params)
    redirect_to admin_order_path
  end
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method)
  end
end
