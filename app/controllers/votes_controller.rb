class VotesController < ApplicationController
  before_action :pre_vote

  def upvote
    if @value.vote == 1
      @value.vote = 0
    else
      @value.vote = 1
    end
    respond_to do |format|
      @value.save

      @vote_total = 0
      @review.votes.each do |vote|
        @vote_total += vote.vote
      end

      # @vote_total = Vote.group(:review_id).sum(:vote)
      format.json { render json: @vote_total }
    end
  end

  def downvote
    if @value.vote == -1
      @value.vote = 0
    else
      @value.vote = -1
    end
    respond_to do |format|
      @value.save
      @vote_total = Vote.group(:review_id).sum(:vote)
      format.json { render json: @vote_total[@review.id] }
    end
  end

  private

  def pre_vote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
  end

end


# if @vote.save
#   respond_to do |format|
#     format.html { redirect_to @vote.review }
#     format.js { render json: @vote, status: :created }
#   end
# end
# vote: {review_id: review.id, user_id: current_user}
