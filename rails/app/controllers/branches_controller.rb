# frozen_string_literal: true

class BranchesController < ApplicationController
  def index
    @branches = Branch.preload(:reviews).paginate(page: params[:page], per_page: 10)
    @area_filtering_form = AreaFilteringForm.new
    @prefectures = Prefecture.all
    @cities = City.all
  end

  def show
    @branch = if params[:name].nil?
                Branch.preload(:company, { city: :prefecture }, reviews: { city: :prefecture }).find(params[:id])
              else
                Branch.preload(:company, { city: :prefecture },
                               reviews: { city: :prefecture }).find_by(name: params[:name])
              end
  end
end
