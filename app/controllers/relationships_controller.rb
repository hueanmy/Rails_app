class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def index
    @user = User.find_by id: params[:user_id]
    unless @user
      flash[:danger] = t "shared.error_messages.not_found_user"
      redirect_to root_path
    end
    @users = @user.send(params[:type]).paginate page: params[:page]
  end

  def create
    user = User.find_by id: params[:followed_id]
    current_user.follow @user
    redirect_to user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def destroy
    user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow @user
    redirect_to user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end
end
