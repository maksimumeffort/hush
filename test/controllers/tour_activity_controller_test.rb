require 'test_helper'

class TourActivityControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get tour_activity_edit_url
    assert_response :success
  end

end
