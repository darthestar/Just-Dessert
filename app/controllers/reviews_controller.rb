class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

    def new
      @review = Review.new
      @dessert = Dessert.find(params[:dessert_id])
    end

    def create
      @dessert = Dessert.find(params[:dessert_id])
      @review = Review.new(review_params)
      @review.dessert = @dessert
      @review.user = current_user
      @reviews = @dessert.reviews.order(created_at: :asc)
      @vote_total = Vote.group(:review_id).sum(:vote)
      if @review.save
        redirect_to dessert_path(@dessert)
      else
        render 'new'
      end
    end

    def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to dessert_review_path
    end

end

private
    def review_params
      params.require(:review).permit(:body)
    end
