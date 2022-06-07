class ReviewsController < ApplicationController
  # before_action :set_ticket, only: [:new, :create]

  def index
    policy_scope(Review)
    @review = Review.new
    @ticket = Ticket.find(params[:ticket_id])
  end

  def show
  end
    
  def create
    @review = Review.new(review_params)
    @review.ticket = Ticket.find(params[:ticket_id])
    @review.ticket.user = current_user
    @review.save!
    authorize @review
    if @review.save!
      redirect_to tickets_path
    else
      flash[:alert] = "Something went wrong."
      render :new, status: :unprocessable_entity ### remember the new!!!!!
    end
  end

  def destroy
    authorize @review
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to tickets_path, status: :see_other
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def review_params
    params.require(:review).permit(:comment, :score)
  end
end
