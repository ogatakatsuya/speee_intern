# frozen_string_literal: true

class SharedApiController < ApplicationController
  def cities
    @cities = City.where(prefecture_id: params[:id])
    respond_to do |format|
      format.json { render json: @cities }
    end
  end
end
