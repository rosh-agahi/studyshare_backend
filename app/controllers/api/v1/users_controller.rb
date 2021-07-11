class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: UserSerializer.new(@users)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { error: 'username is taken.' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
