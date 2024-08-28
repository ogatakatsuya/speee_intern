# frozen_string_literal: true

class AreaFilteringController < ApplicationController
  skip_forgery_protection

  def create
    @area_filtering_form = AreaFilteringForm.new(area_filtering_params)

    if @area_filtering_form.valid?
      redirect_to result_branches_path(prefecture_id: @area_filtering_form.prefecture_id, city_id: @area_filtering_form.city_id)
    else
      redirect_to controller: 'branches', action: 'index'
    end
  end

  private

  def area_filtering_params
    params.require(:area_filtering_form).permit(:prefecture_id, :city_id)
  end
end
