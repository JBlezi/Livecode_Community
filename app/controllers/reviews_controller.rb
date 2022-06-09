class ReviewsController < ApplicationController

  def index
    policy_scope(Review)
    @ticket = Ticket.find(params[:ticket_id])
    @review = Review.new
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    @review.ticket = Ticket.find(params[:ticket_id])
    @review.ticket.user = current_user
    @review.ticket.status = "closed"
    @review.ticket.save
    authorize @review
    if @review.save
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

  def review_params
    params.require(:review).permit(:comment, :score)
  end
end
