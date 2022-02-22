class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end
  
  def edit
    @customer=current_customer
  end
  
  def update
  end
  
  def unsubscribe
    @customer=current_customer
  end
  
  def withdraw
    @customer=current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address)
  end
end
