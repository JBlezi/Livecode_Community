class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
    authorize @chat
  end
end
