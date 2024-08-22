# frozen_string_literal: true

class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :gender
  belongs_to_active_hash :company_satisfaction
  belongs_to_active_hash :contract_type
  belongs_to_active_hash :property_type
  belongs_to_active_hash :sale_reason
  belongs_to_active_hash :sales_count
  belongs_to :city
  belongs_to :branch

  validates :name, presence: true
  validates :gender_id, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :property_type_id, presence: true
  validates :sales_count_id, presence: true
  validates :sale_consideration_period, presence: true
  validates :appraisal_request_period, presence: true
  validates :listing_period, presence: true
  validates :sale_period, presence: true
  validates :transfer_period, presence: true
  validates :appraisal_price, presence: true
  validates :sale_price, presence: true
  validates :discounted, inclusion: { in: [true, false] }
  validates :contract_price, presence: true
  validates :contract_type_id, presence: true
  validates :headline, presence: true
  validates :sale_reason_id, presence: true
  validates :concerns_at_sale, presence: true
  validates :chosen_company_reason, presence: true
  validates :company_satisfaction_id, presence: true
  validates :company_satisfaction_reason, presence: true
  validates :advice_for_future_sellers, presence: true
  validates :public, inclusion: { in: [true, false] }
  validates :ieul_store_id, presence: true
end
