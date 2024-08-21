# frozen_string_literal: true

require 'test_helper'

class PrefectureTest < ActiveSupport::TestCase
  def setup
    @prefecture = Prefecture.new(name: '愛知県')
  end

  test '有効であるレコードとなる' do
    assert @prefecture.valid?
  end

  test '名前が入力されていない場合は有効でないレコードとなる' do
    @prefecture.name = '   '
    assert_not @prefecture.valid?
  end

  test '名前が長すぎる場合は有効でないレコードとなる' do
    @prefecture.name = 'a' * 5
    assert_not @prefecture.valid?
  end
end
