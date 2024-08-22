# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :assessable_areas, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :assessable_cities, through: :assessable_areas, source: :city

  validates :name, presence: true
  validates :post_code, presence: true
  validates :phone_number, presence: true
  validates :fax_number, presence: true
  validates :open_hours, presence: true
  validates :closed_days, presence: true
  validates :catch_copy, presence: true
  validates :introduction, presence: true
  validates :street_address, presence: true
  validates :ieul_branch_id, presence: true, numericality: { only_integer: true }
end
