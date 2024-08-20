# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :yomikata, presence: true, length: { maximum: 20 },
                       format: { with: /\A[ぁ-ゔー]+\z/ }
end
