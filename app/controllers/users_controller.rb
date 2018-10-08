class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "ユーザーを成功させました"
      redirect_to root_url
    else
      flash[:danger] = "ユーザーを作成できません"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end