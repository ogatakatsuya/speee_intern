# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

class AssessmentRequestsController < ApplicationController
  skip_forgery_protection

  IEUL_API_BASE_URL = 'https://miniul-api.herokuapp.com/affiliate/v2'
  URL_PARAM = 'beteran-sumai'

  # 前のページからイエウールの店舗IDをクエリパラメータで受け取る
  # new_assessment_request_path(branch_id: 1)
  def new
    @assessment_request_form = AssessmentRequestForm.new
    @assessment_request_form.branch_id = params[:branch_id]

    @prefectures = Prefecture.all
    @cities = City.all
    @branches = Branch.all
  end

  def create
    @assessment_request_form = AssessmentRequestForm.new(assessment_request_params)
    @assessment_request_form.url_param = URL_PARAM

    @prefectures = Prefecture.all
    @cities = City.all
    @branches = Branch.all

    if @assessment_request_form.valid?
      # TODO: イエウールのAPIを叩いて査定依頼を送信する
      # TODO: 名前とふりがなを空白で結合
      response = send_assessment_request(@assessment_request_form)

      if response.is_a?(Net::HTTPSuccess)
        redirect_to action: :done, status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
    else
      # Turboの仕様により422を返す必要がある
      render :new, status: :unprocessable_entity
    end
  end

  def done; end

  def branches
    @city = City.find_by(id: params[:id])
    return unless @city

    @branches = @city.branches
    respond_to do |format|
      format.json { render json: @branches }
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
        :property_prefecture_id,
        :branch_id
      )
  end

  def send_assessment_request(form)
    # 名前とふりがなを空白で結合
    user_name = "#{form.user_last_name} #{form.user_first_name}"
    user_name_kana = "#{form.user_last_name_kana} #{form.user_first_name_kana}"

    uri = URI.parse("#{IEUL_API_BASE_URL}/conversions")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'

    request = Net::HTTP::Post.new(uri.request_uri, { 'Content-Type' => 'application/json' })
    request.body = {
      branch_id: form.branch_id,
      property_city: form.property_city_id,
      property_address: form.property_address,
      property_type: form.property_type,
      property_exclusive_area: form.property_exclusive_area,
      property_land_area: form.property_land_area,
      property_building_area: form.property_building_area,
      property_building_area_unit: form.property_building_area_unit,
      property_floor_area: form.property_floor_area,
      url_param: URL_PARAM,
      property_room_plan: form.property_room_plan,
      property_constructed_year: form.property_constructed_year,
      user_email: form.user_email,
      user_name:,
      user_name_kana:,
      user_tel: form.user_tel
    }.to_json

    http.request(request)
  end
end
