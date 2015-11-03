class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    # 上の行はインスタンスを作っただけ。saveメソッドで保存しないと、消える。
    @item.save
    redirect_to "/items/#{@item.id}"
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :seller_id, :description, :email, :image_url)
  end
end
