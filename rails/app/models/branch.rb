# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :assessable_areas, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :assessable_cities, through: :assessable_areas, source: :city

  validates :post_code, presence: true
  validates :phone_number, presence: true
  validates :fax_number, presence: true
  validates :open_hours, presence: true
  validates :closed_days, presence: true
  validates :catch_copy, presence: true
  validates :introduction, presence: true
  validates :street_address, presence: true
  validates :ieul_branch_id, presence: true, numericality: { only_integer: true }

  def full_name
    company.name + (name || '本店')
  end

  def full_address
    city.prefecture.name + city.name + street_address
  end

  def city_address
    city.prefecture.name + city.name
  end

  def evaluate_value
    if reviews.blank?
      return {
        average_responsiveness_satisfaction: 0,
        normalized_sales_satisfaction: 0,
        normalized_sales_speed: 0
      }
    end
    # evaluate_valueの範囲
    evaluate_min_value = 1
    evaluate_max_value = 5

    # レビューに関連する全体のデータを一度に取得(db依存性がある MySQL用)
    branch_reviews = reviews.select(
      'AVG(company_satisfaction_id) AS average_satisfaction',
      'AVG(contract_price - appraisal_price) AS min_sales_satisfaction_indicator',
      'AVG(DATEDIFF(sale_period, listing_period)) AS min_sales_speed_indicator'
    ).first

    average_responsiveness_satisfaction = branch_reviews.average_satisfaction

    # 売却満足度の指標の正規化
    min_sales_satisfaction = Review.minimum('contract_price - appraisal_price')
    max_sales_satisfaction = Review.maximum('contract_price - appraisal_price')
    # 正規化して0~1にスケール
    normalized_sales_satisfaction = Normalizer.normalize(branch_reviews.min_sales_satisfaction_indicator,
                                                         min_sales_satisfaction, max_sales_satisfaction)
    # 0~1になったものをevaluate_min_value~evaluate_max_valueにスケールする
    normalized_sales_satisfaction = Normalizer.denormalize(normalized_sales_satisfaction, evaluate_min_value,
                                                           evaluate_max_value)
    # 反転させる
    normalized_sales_satisfaction = (evaluate_max_value + evaluate_min_value) - normalized_sales_satisfaction

    # 売却速度に関する指標の正規化
    sales_speed_limits = Review.select(
      "MIN(DATEDIFF(sale_period, listing_period)) AS min_sales_speed,
      MAX(DATEDIFF(sale_period, listing_period)) AS max_sales_speed"
    ).first

    min_sales_speed = sales_speed_limits.min_sales_speed
    max_sales_speed = sales_speed_limits.max_sales_speed
    normalized_sales_speed = Normalizer.normalize(branch_reviews.min_sales_speed_indicator, min_sales_speed,
                                                  max_sales_speed)
    normalized_sales_speed = Normalizer.denormalize(normalized_sales_speed, evaluate_min_value, evaluate_max_value)
    normalized_sales_speed = (evaluate_max_value + evaluate_min_value) - normalized_sales_speed

    {
      average_responsiveness_satisfaction:,
      normalized_sales_satisfaction:,
      normalized_sales_speed:
    }
  end

  def as_json(options = {})
    super(options.merge(methods: :full_name))
  end
end
