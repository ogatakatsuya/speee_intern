# frozen_string_literal: true

class FilteringInputForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  # 都道府県ID
  attribute :prefecture_id, :integer
  # 市区町村Id
  attribute :city_id, :string

  validates :prefecture_id, presence: true
  validates :city_id, presence: true
end
