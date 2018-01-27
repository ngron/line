class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def talk_list
    @users = User.all
  end
  
  def talk_room 
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録しました"
      redirect_to root_url
    else
      flash.now[:danger] = "登録できませんでした"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
