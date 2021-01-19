require 'test_helper'

class Admin::ExaminationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_examinations_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_examinations_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_examinations_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_examinations_edit_url
    assert_response :success
  end

end
