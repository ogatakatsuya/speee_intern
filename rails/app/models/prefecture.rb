# frozen_string_literal: true

class Prefecture < ApplicationRecord
  validates :name, presence: true, length: { maximum: 4 }
end
