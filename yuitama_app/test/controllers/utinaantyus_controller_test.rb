require 'test_helper'

class UtinaantyusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @utinaantyu = utinaantyus(:one)
  end

  test "should get index" do
    get utinaantyus_url
    assert_response :success
  end

  test "should get new" do
    get new_utinaantyu_url
    assert_response :success
  end

  test "should create utinaantyu" do
    assert_difference('Utinaantyu.count') do
      post utinaantyus_url, params: { utinaantyu: { age: @utinaantyu.age, mailaddress: @utinaantyu.mailaddress, name: @utinaantyu.name } }
    end

    assert_redirected_to utinaantyu_url(Utinaantyu.last)
  end

  test "should show utinaantyu" do
    get utinaantyu_url(@utinaantyu)
    assert_response :success
  end

  test "should get edit" do
    get edit_utinaantyu_url(@utinaantyu)
    assert_response :success
  end

  test "should update utinaantyu" do
    patch utinaantyu_url(@utinaantyu), params: { utinaantyu: { age: @utinaantyu.age, mailaddress: @utinaantyu.mailaddress, name: @utinaantyu.name } }
    assert_redirected_to utinaantyu_url(@utinaantyu)
  end

  test "should destroy utinaantyu" do
    assert_difference('Utinaantyu.count', -1) do
      delete utinaantyu_url(@utinaantyu)
    end

    assert_redirected_to utinaantyus_url
  end
end
