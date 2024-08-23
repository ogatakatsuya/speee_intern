# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessable_areas, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :branches, through: :assessable_areas

  validates :name, presence: true
  validates :yomikata, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
end
