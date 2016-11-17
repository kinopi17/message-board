class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end
  
  # 中略
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
end
