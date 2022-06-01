class ChatsController < ApplicationController
  before_action :set_chats, only: :show

  def show
    @message = Message.new
    authorize @chat

    # Show method for the video chat
    @second_user = current_user == @chat.user ? @chat.ticket.user : @chat.user
    setup_video_call_token
  end

  private

  def set_chats
    @chat = Chat.find(params[:id])
  end

  def setup_video_call_token
    # No chatting with yourself
    return if @second_user == current_user

    twilio = TwilioService.new
    twilio.generate_token(current_user, @second_user)
    @twilio_jwt = twilio.jwt
    @room_id = twilio.room_id
  end
end
