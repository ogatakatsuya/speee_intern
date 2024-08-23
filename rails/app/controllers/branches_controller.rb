# frozen_string_literal: true

class BranchesController < ApplicationController
  def index
    @branches = Branch.paginate(page: params[:page])
  end

  def show
    @branch = Branch.find(params[:id])
    @company = Company.find(@branch.company_id)
    @branch_city = City.find(@branch.city_id)
    @branch_prefecture = Prefecture.find(@branch_city.prefecture_id)
    @reviews = @branch.reviews
  end
end
