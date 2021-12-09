require 'test_helper'

class StampsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get stamps_create_url
    assert_response :success
  end

end
