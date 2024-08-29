# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_breadcrumbs

  def show
    @review = Review.preload(branch: { city: :prefecture }).find(params[:id])

    add_breadcrumb('店舗一覧', branches_path)
    add_breadcrumb(@review.branch.full_name, branch_path(@review.branch))
    add_breadcrumb("#{@review.branch.full_name}の口コミ")
  end

  private

  def add_breadcrumb(label, path = nil)
    @breadcrumbs << { label:, path: }
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end
end
