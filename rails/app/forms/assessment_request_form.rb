# frozen_string_literal: true

class AssessmentRequestForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  TEL_REGEX = /\A0\d{9,10}\z/
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  # 名字
  attribute :user_last_name, :string
  # 名前
  attribute :user_first_name, :string
  # 名字（カナ）
  attribute :user_last_name_kana, :string
  # 名前（カナ）
  attribute :user_first_name_kana, :string
  # メールアドレス
  attribute :user_email, :string
  # 電話番号
  attribute :user_tel, :string

  # 査定依頼を出したいイエウールの店舗ID
  attribute :branch_id, :integer
  # URLパラメータ（'beteran-sumai'を送信）
  attribute :url_param, :string

  # 物件の市区ID
  attribute :property_city_id, :integer
  # 査定依頼する物件の住所
  attribute :property_address, :string
  # 物件種別（1: '分譲マンション', 2: '一戸建て', 3: '土地'）
  attribute :property_type, :integer
  # 専有面積
  attribute :property_exclusive_area, :float
  # 土地面積
  attribute :property_land_area, :float
  # 建物面積
  attribute :property_building_area, :float
  # 建物面積単位（1: '平方メートル', 2: '坪'）
  attribute :property_building_area_unit, :integer
  # 延床面積
  attribute :property_floor_area, :float
  # 間取り（1: '1R', 2: '1K/1DK', ... 13: '6LK/6LDK以上'）
  attribute :property_room_plan, :integer
  # 築年数（1925..2016）
  attribute :property_constructed_year, :integer
  attribute :property_prefecture_id
  attribute :branch_id

  validates :user_first_name, presence: true, length: { maximum: 15 }
  validates :user_last_name, presence: true, length: { maximum: 15 }
  validates :user_first_name_kana, presence: true, length: { maximum: 30 }
  validates :user_last_name_kana, presence: true, length: { maximum: 30 }
  validates :user_tel, presence: true, format: { with: TEL_REGEX }
  # \A: 行頭 \z: 行末
  # /i: 大文字小文字を区別しない
  validates :user_email, presence: true, length: { maximum: 100 }, format: { with: EMAIL_REGEX }

  validates :property_city_id, presence: true
  validates :property_address, presence: true
  validates :property_type, presence: true, numericality: { in: 1..3 }
  validates :property_exclusive_area, presence: true
  validates :property_land_area, presence: true
  validates :property_building_area, presence: true
  validates :property_building_area_unit, presence: true, numericality: { in: 1..2 }
  validates :property_floor_area, presence: true
  validates :property_room_plan, presence: true, numericality: { in: 1..13 }
  validates :property_constructed_year, presence: true, numericality: { greater_than_or_equal_to: 1925 }
  validates :branch_id, presence: true
end
