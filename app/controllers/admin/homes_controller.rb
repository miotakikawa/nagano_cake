class Admin::HomesController < ApplicationController
    def top
     @orders=Order.all
     @order_detail=Order
    end
end
