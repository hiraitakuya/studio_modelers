class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @products = Product.where(user_id: @user).order(created_at: :desc)
  end
end
