# frozen_string_literal: true

class BranchesController < ApplicationController
  def index
    load_dependencies
    @branches = @branches.paginate(page: params[:page], per_page: 10)
  end

  def show
    @branch = if params[:name].nil?
                Branch.preload(:company, { city: :prefecture }, reviews: { city: :prefecture }).find(params[:id])
              else
                c_n = params[:company_name]
                b_n = params[:branch_name]
                if b_n.present?
                  Branch.preload(:company, { city: :prefecture },
                                 reviews: { city: :prefecture }).find_by(name: b_n)
                else
                  Company.find_by(name: params[c_n]).branches.first!
                end

              end
    evaluate_value = @branch.evaluate_value
    @average_responsiveness_satisfaction = evaluate_value[:average_responsiveness_satisfaction]
    @normalized_sales_satisfaction = evaluate_value[:normalized_sales_satisfaction]
    @normalized_sales_speed = evaluate_value[:normalized_sales_speed]
  end

  def result
    load_dependencies

    redirect_to branches_path and return if invalid_prefecture_id? || invalid_city_id?

    if filtering_by_prefecture?
      # 都道府県まで指定した場合
      filter_branches_by_prefecture
    else
      # 市区町村まで指定した場合
      redirect_to branches_path and return unless City.exists?(id: params[:city_id])

      filter_branches_by_city
    end
  end

  private

  def load_dependencies
    @prefectures = Prefecture.all
    @cities = []
    @area_filtering_form = AreaFilteringForm.new
    @branches = Branch.preload(:company, city: :prefecture, reviews: { city: :prefecture })
  end

  def invalid_prefecture_id?
    params[:prefecture_id].nil? || !numeric?(params[:prefecture_id]) || !Prefecture.exists?(id: params[:prefecture_id])
  end

  def invalid_city_id?
    params[:city_id].nil? || !numeric?(params[:city_id])
  end

  def filtering_by_prefecture?
    params[:city_id].present? && params[:city_id].to_i.zero?
  end

  def filter_branches_by_prefecture
    @branches = @branches.joins(:city).where(cities: { prefecture_id: params[:prefecture_id] })
    @branches_per_page = @branches.paginate(page: params[:page], per_page: 10)
    @branch_address = Prefecture.find_by(id: params[:prefecture_id])&.name
  end

  def filter_branches_by_city
    @branches = @branches.where(city_id: params[:city_id]) if params[:city_id].present?
    @branches_per_page = @branches.paginate(page: params[:page], per_page: 10)
    @city = City.find_by(id: params[:city_id])
    @branch_address = @city.city_address if @city.present?
  end

  def numeric?(string)
    string.match?(/\A-?\d+(\.\d+)?\z/)
  end
end
