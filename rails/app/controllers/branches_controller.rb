# frozen_string_literal: true

class BranchesController < ApplicationController
  def index
    @branches = Branch.preload(:reviews).paginate(page: params[:page], per_page: 10)
  end

  def show
    @branch = Branch.preload(:company, city: :prefecture, reviews: { city: :prefecture }).find(params[:id])
    evaluate_value = @branch.evaluate_value
    @average_responsiveness_satisfaction = evaluate_value[:average_responsiveness_satisfaction]
    @normalized_sales_satisfaction = evaluate_value[:normalized_sales_satisfaction]
    @normalized_sales_speed = evaluate_value[:normalized_sales_speed]
  end
end
