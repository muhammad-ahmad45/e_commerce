class UsersController < ApplicationController

  before_action :get_user_params, only: [:show, :edit, :update, :destroy]
  before_action :get_role_params, only: [:show, :edit, :update, :new]
  before_action :authenticate_user!

  def index
    @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def edit; end
  
  def update
    if @user.update!(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @user.destroy
    redirect_to users_path, status: :see_other
  end 

   private
   def user_params
     params.require(:user).permit(:email, :username, :password, role_ids: [])
   end

   def get_user_params
    @user = User.find(params[:id])
   end

   def get_role_params
    @roles = Role.all
   end

end
