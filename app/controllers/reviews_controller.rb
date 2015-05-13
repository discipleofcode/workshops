class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create]
  expose(:review)
  expose(:product)

  def edit
  end

  def create
    self.review = current_user.reviews.new(review_params)

    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      redirect_to category_product_url(product.category, product), error: 'Review was not saved.'
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
