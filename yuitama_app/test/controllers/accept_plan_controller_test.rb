require 'test_helper'

class AcceptPlanControllerTest < ActionDispatch::IntegrationTest
  test "should get planMylist" do
    get accept_plan_planMylist_url
    assert_response :success
  end

  test "should get planDetail" do
    get accept_plan_planDetail_url
    assert_response :success
  end

  test "should get planList" do
    get accept_plan_planList_url
    assert_response :success
  end

end
