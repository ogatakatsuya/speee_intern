# frozen_string_literal: true

class ReviewsController < ApplicationController
  def show
    @review = Review.preload(branch: { city: :prefecture }).find(params[:id])
  end
end
