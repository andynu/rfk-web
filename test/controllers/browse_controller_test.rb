require 'test_helper'

class BrowseControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get folders" do
    get :folders
    assert_response :success
  end

end
