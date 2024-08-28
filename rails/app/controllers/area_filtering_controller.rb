# frozen_string_literal: true

class AreaFilteringController < ApplicationController
  skip_forgery_protection

  def create
    @area_filtering_form = AreaFilteringForm.new(area_filtering_params)

    if @area_filtering_form.valid?
      redirect_to result_path(prefecture_id: @area_filtering_form.prefecture_id, city_id: @area_filtering_form.city_id)
    else
      redirect_to controller: 'branches', action: 'index'
    end
  end

  def result
    @prefectures = Prefecture.all
    @cities = City.all
    @area_filtering_form = AreaFilteringForm.new

    if params[:city_id].present? && params[:city_id].to_i.zero?
      @branches = Branch.preload({ city: :prefecture }, :company, reviews: { city: :prefecture })
      @branches_per_page = @branches.paginate(page: params[:page], per_page: 10)
      @branch_address = Prefecture.find_by(id: params[:prefecture_id]).name
    else
      @city = City.find_by(id: params[:city_id])
      @branches = Branch.preload({ city: :prefecture }, :company, reviews: { city: :prefecture })
      @branches_per_page = @branches.paginate(page: params[:page], per_page: 10)
      @branch_address = @city.city_address
    end
  end

  def cities
    @cities = City.where(prefecture_id: params[:id])
    respond_to do |format|
      format.json { render json: @cities }
    end
  end

  private

  def area_filtering_params
    params.require(:area_filtering_form).permit(:prefecture_id, :city_id)
  end
end
