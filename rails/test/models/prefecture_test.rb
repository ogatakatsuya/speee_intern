require "test_helper"

class PrefectureTest < ActiveSupport::TestCase

  def setup
    @prefecture = Prefecture.new(name:"愛知県")
  end

  test "should be valid" do
    assert @prefecture.valid?
  end

  test "prefecture name should be present" do
    @prefecture.name = "   "
    assert_not @prefecture.valid?
  end

  test "prefecture name should not be too long" do
    @prefecture.name = "a" * 5
    assert_not @prefecture.valid?
  end 
end
