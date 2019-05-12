class ApplicationController < ActionController::Base
  before_action :assign_user

  def change_user
    session[:user_id] = params[:new_user_id]
    @user = User.find_by(id: session[:user_id])

    redirect_to index_path
  end

  # Obviously this code isn't performant
  def assign_user
    @all_users = User.all
    if session[:user_id].blank?
      @user = User.first
      session[:user_id] = @user.id
    else
      @user = User.find_by(id: session[:user_id])
    end
  end
end
