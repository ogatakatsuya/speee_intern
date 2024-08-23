# frozen_string_literal: true

class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    @review_city = City.find(@review.city_id)
    @review_prefecture = Prefecture.find(@review_city.prefecture_id)
    @branch = Branch.find(@review.branch_id)
    @branch_city = City.find(@branch.city_id)
    @branch_prefecture = Prefecture.find(@branch_city.prefecture_id)
  end
end
