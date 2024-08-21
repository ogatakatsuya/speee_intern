# frozen_string_literal: true

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @gender = Gender.first
    @property_type = PropertyType.first
    @sales_count = SalesCount.first
    @contract_type = ContractType.first
    @sale_reason = SaleReason.first
    @company_satisfaction = CompanySatisfaction.first

    @review = Review.new(
      name: 'John Doe',
      gender_id: @gender.id,
      age: 30,
      address: '123 Main St',
      property_type_id: @property_type.id,
      sale_count_id: @sales_count.id,
      sale_consideration_period: '2023-01-01',
      appraisal_request_period: '2023-02-01',
      listing_period: '2023-03-01',
      sale_period: '2023-04-01',
      transfer_period: '2023-05-01',
      appraisal_price: 5000000,
      sale_price: 4800000,
      discounted: false,
      contract_price: 4700000,
      contract_type_id: @contract_type.id,
      headline: 'Great experience!',
      sale_reason_id: @sale_reason.id,
      concerns_at_sale: 'None',
      chosen_company_reason: 'Best offer',
      company_satisfaction_id: @company_satisfaction.id,
      company_satisfaction_reason: 'Excellent service',
      advice_for_future_sellers: 'Be patient',
      areas_for_improvement: 'Better communication',
      public: true,
      ieul_store_id: 1
    )
  end

  test '有効なレコードとなる' do
    assert @review.valid?
  end
end
