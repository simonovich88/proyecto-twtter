require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get press" do
    get likes_press_url
    assert_response :success
  end

end
