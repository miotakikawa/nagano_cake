module Admin::CustomersHelper
  def index
   @item = Item.all
  end

  def show
   @item = Item.find(params[:id])
  end

  def edit
   @item = Item.find(params[:id])
  end

  def update
   @item = Item.find(params[:id])
   @item.update(item_params)
   redirect_to admin_items_path
  end
end
