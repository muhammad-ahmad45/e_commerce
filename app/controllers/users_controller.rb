class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, status: :see_other
   end 

   private
   def user_params
     params.require(:user).permit(:email, :username)
   end
end
