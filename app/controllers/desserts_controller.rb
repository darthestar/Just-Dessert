class DessertsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html, :js

  def index
    @desserts = Dessert.order('name asc')
  end

  def show
    @dessert = Dessert.find(params[:id])
    @reviews = @dessert.reviews.order('created_at desc')
    @review = Review.new
    @review.user = current_user
    @vote_total = Vote.group(:review_id).sum(:vote)
    # respond_to do |format|
    #   format.json { ... }
    #   format.html
    # end
  end

  def new
    @dessert = Dessert.new
  end

  def create
    @dessert = Dessert.new(dessert_params)
    @dessert.user = current_user
    if @dessert.save
      redirect_to desserts_path
    else
      render 'new'
    end
  end

  def edit
    @dessert = Dessert.find(params[:id])
  end

  def update
    @dessert = Dessert.find(params[:id])
    @dessert.update_attributes(dessert_params)

    if @dessert.save
      redirect_to desserts_path
    else
      render 'edit'
    end
  end

  private

  def dessert_params
    params.require(:dessert).permit(:name, :description)
  end
end
