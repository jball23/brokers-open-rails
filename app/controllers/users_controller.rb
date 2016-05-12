class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    user = {
      profile: @user,
      listings: @user.listings
    }
    render json: user
    # render json: @user, include: :listings
  end

  def create
    @user = User.create!(user_params)
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update!(update_user_params)
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render nothing:true
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :agency, :avatar)
  end
  
  def update_user_params
    params.require(:profile).permit(:first_name, :last_name, :email, :phone, :agency, :avatar)
  end

end
