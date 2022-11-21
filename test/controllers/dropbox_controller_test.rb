require 'test_helper'

class DropboxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dropbox_index_url
    assert_response :success
  end

end