require 'test_helper'

class Shipment::GuidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shipment_guides_index_url
    assert_response :success
  end

  test "should get show" do
    get shipment_guides_show_url
    assert_response :success
  end

  test "should get new" do
    get shipment_guides_new_url
    assert_response :success
  end

end
