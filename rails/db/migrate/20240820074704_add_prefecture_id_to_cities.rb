# frozen_string_literal: true

class AddPrefectureIdToCities < ActiveRecord::Migration[7.1]
  def change
    add_reference :cities, :prefecture, foreign_key: true
  end
end
