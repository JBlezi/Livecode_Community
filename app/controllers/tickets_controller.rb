class TicketsController < ApplicationController
  before_action :set_tickets, only: [:show, :edit, :update, :destroy]
  
  def index
    @tickets = policy_scope(Ticket)
  end

  def show
    authorize @ticket
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    authorize @ticket
    @ticket.user = current_user
    @ticket.save!
    redirect_to ticket_path(@ticket)
  end

  def edit
    authorize @ticket
  end

  def update
    authorize @ticket
    @ticket.update(ticket_params)
    redirect_to ticket_path(@ticket)
  end

  def destroy
    authorize @ticket
    @ticket.destroy
    redirect_to tickets_index_path, status: :see_other
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :content, :language)
  end

  def set_tickets
    @ticket = Ticket.find(params[:id])
  end
end
