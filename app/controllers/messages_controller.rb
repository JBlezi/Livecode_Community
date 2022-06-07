class MessagesController < ApplicationController
  def index
    @messages = policy_scope(Message)
    @chats = policy_scope(Chat)
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params)
    authorize @message
    @message.chat = @chat
    @message.user = current_user
    if @message.save
      ChatChannel.broadcast_to(
        @chat,
        render_to_string(partial: "message", locals: { message: @message })
      )
      NotificationChannel.broadcast_to(
        "navbar-notification",
        current_user.id.to_s
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
