class ChatsController < ApplicationController
  before_action :set_chats, only: :show

  def show
    @message = Message.new
    authorize @chat

    # Show method for the video chat
    if current_user == @chat.ticket.user
      @user = @chat.user
    else
      @user = @chat.user.id
    end
    setup_video_call_token
  end

  private

  def set_chats
    @chat = Chat.find(params[:id])
  end

  def setup_video_call_token
    # No chatting with yourself
    return if @user == current_user

    twilio = TwilioService.new
    twilio.generate_token(current_user, @user)
    @twilio_jwt = twilio.jwt
    @room_id = twilio.room_id
  end
end
