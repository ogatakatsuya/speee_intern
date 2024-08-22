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
      name: '田中 太郎',
      gender_id: @gender.id,
      age: 30,
      address: '愛知県 名古屋市',
      property_type_id: @property_type.id,
      sales_count_id: @sales_count.id,
      sale_consideration_period: '2023-01-01',
      appraisal_request_period: '2023-02-01',
      listing_period: '2023-03-01',
      sale_period: '2023-04-01',
      transfer_period: '2023-05-01',
      appraisal_price: 5000000,
      sale_price: 4800000,
      discounted: false,
      months_to_discount: nil,
      discount_price: nil,
      contract_price: 4800000,
      contract_type_id: @contract_type.id,
      headline: 'とても対応が丁寧でした！',
      sale_reason_id: @sale_reason.id,
      concerns_at_sale: '特にありません。',
      chosen_company_reason: '何となくです！',
      company_satisfaction_id: @company_satisfaction.id,
      company_satisfaction_reason: '対応がとても優しかったから。',
      advice_for_future_sellers: '我慢強く待ってください。',
      areas_for_improvement: 'もっとコミュニケーションをとってほしい。',
      public: false,
      ieul_store_id: 1
    )
  end

  test '有効なレコードとなる' do
    assert @review.valid?
  end

  test '名前がない場合は無効である' do
    @review.name = '   '
    assert_not @review.valid?
  end

  test '性別がない場合は無効である' do
    @review.gender_id = nil
    assert_not @review.valid?
  end

  test '年齢がない場合は無効である' do
    @review.age = nil
    assert_not @review.valid?
  end

  test '住所がない場合は無効である' do
    @review.address = '   '
    assert_not @review.valid?
  end

  test '物件種別IDがない場合は無効である' do
    @review.property_type_id = nil
    assert_not @review.valid?
  end

  test '売却回数がない場合は無効である' do
    @review.sales_count_id = nil
    assert_not @review.valid?
  end

  test '売却検討時期がない場合は無効である' do
    @review.sale_consideration_period = nil
    assert_not @review.valid?
  end

  test '査定依頼時期がない場合は無効である' do
    @review.appraisal_request_period = nil
    assert_not @review.valid?
  end

  test '売出時期がない場合は無効である' do
    @review.listing_period = nil
    assert_not @review.valid?
  end

  test '売却時期がない場合は無効である' do
    @review.sale_period = nil
    assert_not @review.valid?
  end

  test '引渡時期がない場合は無効である' do
    @review.transfer_period = nil
    assert_not @review.valid?
  end

  test '査定価格がない場合は無効である' do
    @review.appraisal_price = nil
    assert_not @review.valid?
  end

  test '販売価格がない場合は無効である' do
    @review.sale_price = nil
    assert_not @review.valid?
  end

  test 'discountedがtrueまたはfalse以外の場合は無効である' do
    @review.discounted = nil
    assert_not @review.valid?
  end

  test '成約価格がない場合は無効である' do
    @review.contract_price = nil
    assert_not @review.valid?
  end

  test '媒介契約形態IDがない場合は無効である' do
    @review.contract_type_id = nil
    assert_not @review.valid?
  end

  test '見出しがない場合は無効である' do
    @review.headline = nil
    assert_not @review.valid?
  end

  test '売却理由IDがない場合は無効である' do
    @review.sale_reason_id = nil
    assert_not @review.valid?
  end

  test '売却時の懸念がない場合は無効である' do
    @review.concerns_at_sale = nil
    assert_not @review.valid?
  end

  test '選んだ会社の理由がない場合は無効である' do
    @review.chosen_company_reason = nil
    assert_not @review.valid?
  end

  test '対応満足度IDがない場合は無効である' do
    @review.company_satisfaction_id = nil
    assert_not @review.valid?
  end

  test '対応満足度の理由がない場合は無効である' do
    @review.company_satisfaction_reason = nil
    assert_not @review.valid?
  end

  test '今後売却する人へのアドバイスがない場合は無効である' do
    @review.advice_for_future_sellers = nil
    assert_not @review.valid?
  end

  test '会社が改善すべき点がない場合は無効である' do
    @review.areas_for_improvement = nil
    assert_not @review.valid?
  end

  test 'publicがtrueまたはfalse以外の場合は無効である' do
    @review.public = nil
    assert_not @review.valid?
  end

  test 'ieul_store_idがない場合は無効である' do
    @review.ieul_store_id = nil
    assert_not @review.valid?
  end
end
