# frozen_string_literal: true

class AssessmentRequestsController < ApplicationController
  skip_forgery_protection

  URL_PARAM = 'beteran-sumai'

  # 前のページからイエウールの店舗IDをクエリパラメータで受け取る
  # new_assessment_request_path(branch_id: 1)
  def new
    @assessment_request_form = AssessmentRequestForm.new
    @assessment_request_form.branch_id = params[:branch_id]

    @prefectures = Prefecture.all
    @cities = City.all
  end

  def create
    @assessment_request_form = AssessmentRequestForm.new(assessment_request_params)
    @assessment_request_form.branch_id = params[:branch_id]
    @assessment_request_form.url_param = URL_PARAM

    @prefectures = Prefecture.all
    @cities = City.all

    if @assessment_request_form.valid?
      # TODO: イエウールのAPIを叩いて査定依頼を送信する
      # TODO: 名前とふりがなを空白で結合
    else
      # Turboの仕様により422を返す必要がある
      render :new, status: :unprocessable_entity
    end
  end

  def cities
    @cities = City.where(prefecture_id: params[:id])
    respond_to do |format|
      format.json { render json: @cities }
    end
  end

  private

  def assessment_request_params
    params
      .require(:assessment_request_form)
      .permit(
        :user_first_name,
        :user_last_name,
        :user_first_name_kana,
        :user_last_name_kana,
        :user_tel,
        :user_email,
        :property_city_id,
        :property_address,
        :property_type,
        :property_exclusive_area,
        :property_land_area,
        :property_building_area,
        :property_building_area_unit,
        :property_floor_area,
        :property_room_plan,
        :property_constructed_year,
        :property_prefecture_id
      )
  end
end
