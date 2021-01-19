require 'test_helper'

class Public::ExaminationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_examinations_index_url
    assert_response :success
  end

  test "should get show" do
    get public_examinations_show_url
    assert_response :success
  end

end
