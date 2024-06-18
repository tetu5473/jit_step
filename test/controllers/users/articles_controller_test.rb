require "test_helper"

class Users::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get users_articles_show_url
    assert_response :success
  end

  test "should get new" do
    get users_articles_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_articles_edit_url
    assert_response :success
  end
end
