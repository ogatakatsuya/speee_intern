# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :brances, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  validates :yomikata, presence: true, length: { maximum: 20 },
                       format: { with: /\A[ぁ-んー]+\z/ }
end
