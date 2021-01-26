require 'test_helper'

class Admin::CongestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_congestions_index_url
    assert_response :success
  end

end
