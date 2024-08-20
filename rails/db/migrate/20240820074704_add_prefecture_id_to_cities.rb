# frozen_string_literal: true

class AddPrefectureIdToCities < ActiveRecord::Migration[7.1]
  def change
    add_column :cities, :prefecture_id, :integer
  end
end
