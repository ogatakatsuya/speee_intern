# frozen_string_literal: true

class BranchesController < ApplicationController
  def index
    @branches = Branch.preload(:reviews).paginate(page: params[:page], per_page: 10)
  end

  def show
    if params[:name].nil?
      @branch = Branch.preload(:company, { city: :prefecture }, reviews: { city: :prefecture }).find(params[:id])
    else
      @branch = Branch.preload(:company, { city: :prefecture }, reviews: { city: :prefecture }).find_by(name: params[:name])
    end
  end
end
