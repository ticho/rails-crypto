require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/"
    assert_response :success
  end

  test "should have a refresh button" do
    get root_path
    assert_select 'input[value=?]', 'Refresh'
  end

  test "should have a dropdown menu" do
    get root_path
    assert_select 'select'
  end

end
