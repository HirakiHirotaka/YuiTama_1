require 'test_helper'

class ProvidePlanControllerTest < ActionDispatch::IntegrationTest
  test "should get planInput" do
    get provide_plan_planInput_url
    assert_response :success
  end

  test "should get regiComp" do
    get provide_plan_regiComp_url
    assert_response :success
  end

  test "should get myPlanList" do
    get provide_plan_myPlanList_url
    assert_response :success
  end

end
