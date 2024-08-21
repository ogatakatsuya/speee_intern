# frozen_string_literal: true

require 'test_helper'

class AssessableAreaTest < ActiveSupport::TestCase
  def setup
    @branch = branches(:example_branch)
    @city = cities(:example_city)
    @assessable_area = AssessableArea.new(branch: @branch, city: @city)
  end

  test '有効であるレコードとなる' do
    assert @assessable_area.valid?
  end

  test 'Branchへの関連付けがない場合は有効でないレコードになる' do
    @assessable_area.branch = nil
    assert_not @assessable_area.valid?
  end

  test 'Cityへの関連付けがない場合は有効でないレコードになる' do
    @assessable_area.city = nil
    assert_not @assessable_area.valid?
  end
end
