class UsersController < ApplicationController
  def show
    unless current_user
      redirect_to root_path
    end
    @user = current_user
    @items = @user.items
    @item = Item.new
  end
end
