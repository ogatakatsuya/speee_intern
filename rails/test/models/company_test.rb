# frozen_string_literal: true

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: 'Example Corp', logo_url: 'http://example.com/logo.png', ieul_company_id: '12345')
  end

  test '有効であるレコードとなる' do
    assert @company.valid?
  end

  test '名前が入力されていない場合は有効でないレコードになる' do
    @company.name = '  '
    assert_not @company.valid?
  end

  test 'ロゴURLが入力されていない場合は有効でないレコードになる' do
    @company.logo_url = '  '
    assert_not @company.valid?
  end

  test 'IEULの会社IDが入力されていない場合は有効でないレコードになる' do
    @company.ieul_company_id = '  '
    assert_not @company.valid?
  end
end
