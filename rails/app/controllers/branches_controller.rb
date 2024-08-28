# frozen_string_literal: true

class BranchesController < ApplicationController
  def index
    @branches = Branch.preload(:reviews).paginate(page: params[:page], per_page: 10)
  end

  def show
    @branch = Branch.preload(:company, { city: :prefecture }, reviews: { city: :prefecture }).find(params[:id])

    # レビューに関連する全体のデータを一度に取得(db依存性がある MySQL用)
    branch_reviews = @branch.reviews.select(
      "AVG(company_satisfaction_id) AS average_satisfaction",
      "AVG(contract_price - appraisal_price) AS min_sales_satisfaction_indicator",
      "AVG(DATEDIFF(sale_period, listing_period)) AS min_sales_speed_indicator",
    ).first

    @average_responsiveness_satisfaction = branch_reviews.average_satisfaction

    # 売却満足度の指標の正規化
    min_sales_satisfaction = Review.minimum("contract_price - appraisal_price")
    max_sales_satisfaction = Review.maximum("contract_price - appraisal_price")
    # 差があればあるほど値が小さくなるように反転させている
    @normalized_sales_satisfaction = 6 - (1 + ((branch_reviews.min_sales_satisfaction_indicator - min_sales_satisfaction) * 4) / (max_sales_satisfaction - min_sales_satisfaction))

    # 売却速度に関する指標の正規化
    sales_speed_limits = Review.select(
      "MIN(DATEDIFF(sale_period, listing_period)) AS min_sales_speed, 
      MAX(DATEDIFF(sale_period, listing_period)) AS max_sales_speed"
    ).first

    min_sales_speed = sales_speed_limits.min_sales_speed
    max_sales_speed = sales_speed_limits.max_sales_speed
    # 差があればあるほど値が小さくなるように反転させている
    @normalized_sales_speed = 6 - (1 + ((branch_reviews.min_sales_speed_indicator - min_sales_speed) * 4) / (max_sales_speed - min_sales_speed))
  end
end
