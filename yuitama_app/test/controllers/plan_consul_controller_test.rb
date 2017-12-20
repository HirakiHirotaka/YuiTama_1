require 'test_helper'

class PlanConsulControllerTest < ActionDispatch::IntegrationTest
  test "should get consensus" do
    get plan_consul_consensus_url
    assert_response :success
  end

end
