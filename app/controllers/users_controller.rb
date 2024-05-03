class UsersController < ApplicationController
  # ユーザーがログインしているか確認
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @user は set_user によりセットされる
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    # ユーザーが自身のプロフィールを編集することのみを許可
    redirect_to(root_path, alert: "Access denied.") unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
