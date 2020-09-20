require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get homes_import_url
    assert_response :success
  end

  test "should get export" do
    get homes_export_url
    assert_response :success
  end

  test "should get show" do
    get homes_show_url
    assert_response :success
  end

end
