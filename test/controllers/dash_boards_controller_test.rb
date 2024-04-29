require "test_helper"

class DashBoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dash_boards_index_url
    assert_response :success
  end
end
