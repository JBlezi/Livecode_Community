class ReviewsController < ApplicationController

  before_action :set_ticket, only: %i[new create]

  def new
    # We need @ticket in our `simple_form_for`
    @ticket = Ticket.find(params[:ticket_id])
    @review = Review.new
    authorize @review
  end
    
  def create
    @review = Review.new(review_params)
    @review.ticket = @ticket
    authorize @review
    if @review.save
     redirect_to tickets_path
    else
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
    @ticket = ticket.find(params[:ticket_id])
  end

  def review_params
        params.require(:review).permit(:content)
  end
end
