class TicketsController < ApplicationController
  before_action :set_tickets, only: [:show, :edit, :update, :destroy]
  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
    redirect_to tickets_show_path
  end

  def edit
  end

  def update
    @ticket.update(ticket_params)
    redirect_to ticket_path(@ticket)
  end

  def destroy
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
