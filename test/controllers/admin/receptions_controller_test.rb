require 'test_helper'

class Admin::ReceptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_receptions_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_receptions_show_url
    assert_response :success
  end

end
