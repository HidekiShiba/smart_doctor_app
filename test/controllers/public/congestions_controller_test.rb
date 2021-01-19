require 'test_helper'

class Public::CongestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_congestions_index_url
    assert_response :success
  end

end
