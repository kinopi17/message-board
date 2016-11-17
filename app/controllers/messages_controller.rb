class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def edit
  end

  def update
    if @message.update(message_params)
    redirect_to root_path , notice:'メッセージを編集しました'
    else
       render 'edit'
    end
  end  
  
  def destroy
    @message.destroy
    redirect_to root_path,notice:'メッセージを削除しました'
  end
  
  def index
    @messages = Message.all
    @message = Message.new
  end
  
  #　中略
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  def message_params
    params.require(:message).permit(:name, :body)
  end

  def set_message
  @message = Message.find(params[:id])
  end
end
