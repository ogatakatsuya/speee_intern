require "test_helper"

class AssessableAreaTest < ActiveSupport::TestCase
  def setup
    @branch = branches(:example_branch)
    @city = cities(:example_city)
    @assessable_area = AssessableArea.new(branch: @branch, city: @city)
  end

  test "should be valid with valid branch and city" do
    assert @assessable_area.valid?
  end

  test "should be invalid without a branch" do
    @assessable_area.branch = nil
    assert_not @assessable_area.valid?
  end

  test "should be invalid without a city" do
    @assessable_area.city = nil
    assert_not @assessable_area.valid?
  end
end
