class ChatsController < ApplicationController
  before_action :set_chats, only: :show

  def create
    @chat = Chat.create(ticket_id: params[:ticket_id], user_id: current_user.id)
    authorize @chat
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.status = "in_progress"
    @ticket.save
    redirect_to chat_path(@chat)
  end

  def show
    @chat.ticket.status = "in_progress"
    @review = Review.new
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
