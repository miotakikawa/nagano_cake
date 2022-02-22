class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
  end
  
  def edit
    @cusotmer=Customer.find(params[:id])
  end
  
  def update
  end
  
  def unsubscribe
  end
  
  def withdraw
  end
  
  private
  def item_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address)
  end
end
