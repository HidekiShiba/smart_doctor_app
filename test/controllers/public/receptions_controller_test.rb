require 'test_helper'

class Public::ReceptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_receptions_index_url
    assert_response :success
  end

  test "should get new" do
    get public_receptions_new_url
    assert_response :success
  end

end
