require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  def setup
    @company = companies(:example_company)
    @city = cities(:example_city)
    @branch = Branch.new(
      name: 'Example Branch',
      post_code: '123-4567',
      phone_number: '012-3456-789',
      fax_number: '012-3456-790',
      open_hours: '9:00 - 18:00',
      closed_days: 'Saturday, Sunday',
      catch_copy: 'Best in Town',
      introduction: 'We are the best branch for your needs.',
      street_address: '123 Example St.',
      ieul_branch_id: 102,
      company: @company,
      city: @city
    )
  end

  test '有効であるレコードとなる' do
    assert @branch.valid?
  end

  test '名前が入力されていない場合は有効でないレコードになる' do
    @branch.name = '  '
    assert_not @branch.valid?
  end

  test '郵便番号が入力されていない場合は有効でないレコードになる' do
    @branch.post_code = '  '
    assert_not @branch.valid?
  end

  test '電話番号が入力されていない場合は有効でないレコードになる' do
    @branch.phone_number = '  '
    assert_not @branch.valid?
  end

  test 'FAX番号が入力されていない場合は有効でないレコードになる' do
    @branch.fax_number = '  '
    assert_not @branch.valid?
  end

  test '営業時間が入力されていない場合は有効でないレコードになる' do
    @branch.open_hours = '  '
    assert_not @branch.valid?
  end

  test '定休日が入力されていない場合は有効でないレコードになる' do
    @branch.closed_days = '  '
    assert_not @branch.valid?
  end

  test 'キャッチコピーが入力されていない場合は有効でないレコードになる' do
    @branch.catch_copy = '  '
    assert_not @branch.valid?
  end

  test '紹介文が入力されていない場合は有効でないレコードになる' do
    @branch.introduction = '  '
    assert_not @branch.valid?
  end

  test '住所が入力されていない場合は有効でないレコードになる' do
    @branch.street_address = '  '
    assert_not @branch.valid?
  end

  test 'IEULの支店IDが入力されていない場合は有効でないレコードになる' do
    @branch.ieul_branch_id = nil
    assert_not @branch.valid?
  end

  test 'Companyへの関連付けがない場合は有効でないレコードになる' do
    @branch.company = nil
    assert_not @branch.valid?
  end

  test 'Cityへの関連付けがない場合は有効でないレコードになる' do
    @branch.city = nil
    assert_not @branch.valid?
  end
end
