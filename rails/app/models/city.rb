# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  validates :name, presence: true, length: { maximum: 20 }
  validates :yomikata, presence: true, length: { maximum: 20 },
                       format: { with: /\A[ぁ-んー]+\z/ }
end
