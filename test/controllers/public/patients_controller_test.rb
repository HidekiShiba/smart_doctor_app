require 'test_helper'

class Public::PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_patients_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_patients_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_patients_unsubscribe_url
    assert_response :success
  end

end
