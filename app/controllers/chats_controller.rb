class ChatsController < ApplicationController
  before_action :set_chats, only: :show

  def show
    @message = Message.new
    authorize @chat
  end

  private

  def set_chats
    @chat = Chat.find(params[:id])
  end
end
