class RolesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @role = @user.roles.create(role_params)
    redirect_to root_path
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @role = @user.roles.find(params[:id])
    @role.destroy
    redirect_to root_path
  end
          
  private
    def role_params
      params.require(:role).permit(:user_role)
    end
  end