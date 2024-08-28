# frozen_string_literal: true

class BranchesController < ApplicationController
  def index
    @branches = Branch.preload(:company, { city: :prefecture }, reviews: { city: :prefecture }).paginate(page: params[:page], per_page: 10)
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

  def result
    @prefectures = Prefecture.all
    @cities = City.all
    @area_filtering_form = AreaFilteringForm.new
    @branches = Branch.preload({ city: :prefecture }, :company, reviews: { city: :prefecture })

    if params[:city_id].present? && params[:city_id].to_i.zero?
      @branches = @branches.joins(:city).where(cities: { prefecture_id: params[:prefecture_id] })
      @branches_per_page = @branches.paginate(page: params[:page], per_page: 10)
      @branch_address = Prefecture.find_by(id: params[:prefecture_id]).name
    else
      @branches = @branches.where(city_id: params[:city_id]) if params[:city_id].present?
      @branches_per_page = @branches.paginate(page: params[:page], per_page: 10)
      @city = City.find_by(id: params[:city_id])
      @branch_address = @city.city_address if @city.present?
    end
  end
end
