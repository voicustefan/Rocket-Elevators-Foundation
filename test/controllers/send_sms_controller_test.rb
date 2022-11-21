require 'test_helper'

class SendSmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @send_sm = send_sms(:one)
  end

  test "should get index" do
    get send_sms_url
    assert_response :success
  end

  test "should get new" do
    get new_send_sm_url
    assert_response :success
  end

  test "should create send_sm" do
    assert_difference('SendSm.count') do
      post send_sms_url, params: { send_sm: {  } }
    end

    assert_redirected_to send_sm_url(SendSm.last)
  end

  test "should show send_sm" do
    get send_sm_url(@send_sm)
    assert_response :success
  end

  test "should get edit" do
    get edit_send_sm_url(@send_sm)
    assert_response :success
  end

  test "should update send_sm" do
    patch send_sm_url(@send_sm), params: { send_sm: {  } }
    assert_redirected_to send_sm_url(@send_sm)
  end

  test "should destroy send_sm" do
    assert_difference('SendSm.count', -1) do
      delete send_sm_url(@send_sm)
    end

    assert_redirected_to send_sms_url
  end
end
