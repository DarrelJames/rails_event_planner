require 'test_helper'

class RsvpsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get rsvps_show_url
    assert_response :success
  end

  test "should get new" do
    get rsvps_new_url
    assert_response :success
  end

end
