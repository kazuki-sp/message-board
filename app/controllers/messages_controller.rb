class MessagesController < ApplicationController
  before_action :set_message,only: [:show, :edit, :update, :destroy]
  
  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params) #データベースにデータが登録されるまではnewを使う
    
    if @message.save
      flash[:success] = 'Message が正常に投稿されました' 
      redirect_to @message
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      flash[:success] = 'Messageは正常に更新できました'
      redirect_to @message
    else
      flash.now[:danger] = 'Messageは更新できませんでした'
      render :edit
    end
  end
  def destroy
    @message.destroy
    flash[:success] = 'Messageは正常に削除できました'
    redirect_to messages_url
  end
  
  private
  
  #Strong Parameter
  def set_message
    @message = Message.find(params[:id])
  end
  
  
  def message_params
    params.require(:message).permit(:content, :title)
  end
end

