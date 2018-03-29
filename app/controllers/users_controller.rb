class UsersController < ApplicationController
  def show
    unless current_user
      redirect_to home_path
    end
    @user = current_user
  end
end
