# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :assessable_areas, dependent: :destroy

  validates :name, presence: true
  validates :post_code, presence: true
  validates :phone_number, presence: true
  validates :street_address, presence: true
  validates :ieul_branch_id, presence: true
end
