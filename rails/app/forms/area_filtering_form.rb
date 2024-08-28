# frozen_string_literal: true

class AreaFilteringForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :prefecture_id, :integer
  attribute :city_id, :integer

  validates :prefecture_id, presence: true
end
