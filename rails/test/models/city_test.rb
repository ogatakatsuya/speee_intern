# frozen_string_literal: true

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  def setup
    @prefecture = prefectures(:hokkaido)
    @city = City.new(name: '名古屋市', yomikata: 'なごやし', prefecture_id: @prefecture.id)
  end

  test '有効であるレコードとなる' do
    assert @city.valid?
  end

  test '名前が入力されていない場合は有効でないレコードになる' do
    @city.name = '  '
    assert_not @city.valid?
  end

  test '名前が長すぎる時は有効でないレコードになる' do
    @city.name = 'a' * 21
    assert_not @city.valid?
  end

  test '読み方が入力されていない場合は有効でないレコードになる' do
    @city.yomikata = '  '
    assert_not @city.valid?
  end

  test '読み方が長すぎる場合は有効でないレコードになる' do
    @city.yomikata = 'a' * 51
    assert_not @city.valid?
  end

  # test '読み方がひらがなでない場合は有効でないレコードになる' do
  #   @city.yomikata = '漢字'
  #   assert_not @city.valid?
  # end

  test '外部キーがPrefectureからCityに適切に貼られている' do
    assert_equal @prefecture, @city.prefecture
  end
end
