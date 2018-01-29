class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def talk_list
    @users = User.all
  end
  
  def talk_room 
    @users = User.all
    @message = current_user.messages.build
    @messages = Message.all
    @user = User.find(params[:id])
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
  
  def message_create
    # binding.pry
    # @reply = params[:reply_id]
    
    @message = current_user.messages.build(message_params)
    # @message.reply_id = @reply
    
    if @message.save
      redirect_to talk_room_user_path
    else
      render :talk_room
    end
  end
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def message_params
    params.require(:message).permit(:content,:reply_id)
  end
end
