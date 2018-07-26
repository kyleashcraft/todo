class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Item failed to save."
      redirect_back(fallback_location: root_path)
    end
  end

  def delete
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "#{@item.name} removed."
    else
      flash[:alert] = "Error deleting #{@item.name}"
    end
    redirect_to root_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :user)
    end
end
