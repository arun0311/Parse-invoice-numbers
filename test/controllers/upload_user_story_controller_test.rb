require 'test_helper'

class UploadUserStoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upload_user_story_index_url
    assert_response :success
  end

end
