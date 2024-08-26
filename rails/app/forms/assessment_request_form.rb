class AssessmentRequestForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  # 査定依頼を出したいイエウールの店舗ID
  attribute :branch_id, :integer
  # 物件の市区ID
  attribute :property_city, :integer
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
  # URLパラメータ（'beteran-sumai'を送信）
  attribute :url_param, :string
  # 間取り（1: '1R', 2: '1K/1DK', ... 13: '6LK/6LDK以上'）
  attribute :property_room_plan, :integer
  # 築年数（1925..2016の範囲）
  attribute :property_constructed_year, :integer
  # メールアドレス（100字以内、「@」「.」を含む）
  attribute :user_email, :string
  # 姓
  attribute :user_last_name, :string
  # 名
  attribute :user_first_name, :string
  # セイ
  attribute :user_last_name_kana, :string
  # メイ
  attribute :user_first_name_kana, :string
  # 電話番号（10～11桁、先頭は数字0）
  attribute :user_tel, :string

  # 存在性のバリデーション
  validates(
    :user_last_name,
    :user_first_name,
    :user_last_name_kana,
    :user_first_name_kana,
    :user_tel,
    :user_email,

    :branch_id,
    :url_param,

    :property_city,
    :property_address,
    :property_type,
    :property_exclusive_area,
    :property_land_area,
    :property_building_area,
    :property_building_area_unit,
    :property_floor_area,
    :property_room_plan,
    :property_constructed_year,
    presence: true
  )
  # 存在性以外のバリデーション
  validates(
    :property_type,
    numericality: { in: 1..3 }
  )
  validates(
    :property_building_area_unit,
    numericality: { in: 1..2 }
  )
  validates(
    :property_room_plan,
    numericality: { in: 1..13 }
  )
  validates(
    :property_constructed_year,
    numericality: { in: 1925..2016 }
  )
  validates(
    :user_email,
    length: { maximum: 100 },
    # \Aで先頭の数字を指定
    # \zで最後の数字を指定
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  )
  validates(
    :user_last_name,
    length: { maximum: 15 }
  )
  validates(
    :user_first_name,
    length: { maximum: 15 }
  )
  validates(
    :user_last_name_kana,
    length: { maximum: 30 }
  )
  validates(
    :user_first_name_kana,
    length: { maximum: 30 }
  )
  validates(
    :user_tel,
    format: { with: /\A0\d{9,10}\z/ }
  )
end