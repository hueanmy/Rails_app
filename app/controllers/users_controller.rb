class UsersController < ApplicationController
  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t"shared.error_messages.not_found_user"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
