require 'test_helper'

class PersonalInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get personal_info_input_url
    assert_response :success
  end

end
