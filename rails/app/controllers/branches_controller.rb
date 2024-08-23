# frozen_string_literal: true

class BranchesController < ApplicationController
  def index
    @branches = Branch.paginate(page: params[:page])
  end

  def show
    @branch = Branch.preload(:company, { city: :prefecture }, reviews: { city: :prefecture }).find(params[:id])
  end
end
