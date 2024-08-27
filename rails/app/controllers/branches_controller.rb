# frozen_string_literal: true

class BranchesController < ApplicationController
  def index
    @branches = Branch.preload(:reviews).paginate(page: params[:page], per_page: 10)
  end

  def show
    @branch = if params[:id] && params[:id] =~ /^\d+$/
                # `id` が数値の場合
                Branch.preload(:company, { city: :prefecture }, reviews: { city: :prefecture }).find(params[:id])
              else
                # `id` が数値でない場合は `name` で検索
                Branch.preload(:company, { city: :prefecture },
                               reviews: { city: :prefecture }).find_by(name: params[:id])
              end
  end
end
