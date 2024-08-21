# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :branches, dependent: :destroy

  validates :name, presence: true
  validates :logo_url, presence: true
  validates :ieul_company_id, presence: true, numericality: {only_integer: true}
end
