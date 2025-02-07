module Admin
  class UsersController < ApplicationController
    def index
      @users = User.where.not(role: :admin)  # Show all except admins
    end

    def update
      user = User.find(params[:id])
      user.update(role: params[:role])
      redirect_to admin_users_path, notice: "User updated!"
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to admin_users_path, notice: "User deleted!"
    end
  end
end
