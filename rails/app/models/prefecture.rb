# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :cities
  validates :name, presence: true, length: { maximum: 4 }
end
