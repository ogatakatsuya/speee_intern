# frozen_string_literal: true

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  def setup
    @city = City.new(name: '名古屋市', yomikata: 'なごやし')
  end

  test 'should be valid' do
    assert @city.valid?
  end

  test 'city name should not be present' do
    @city.name = '  '
    assert_not @city.valid?
  end

  test 'city name should not be too long' do
    @city.name = 'a' * 21
    assert_not @city.valid?
  end

  test 'yomikata should be present' do
    @city.yomikata = '  '
    assert_not @city.valid?
  end

  test 'yomikata should not be too long' do
    @city.yomikata = 'a' * 21
    assert_not @city.valid?
  end

  test 'yomikata should be hiragane' do
    @city.yomikata = '漢字'
    assert_not @city.valid?
  end
end
