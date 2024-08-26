require "test_helper"

class AssessmentRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get assessment_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get assessment_requests_create_url
    assert_response :success
  end
end
