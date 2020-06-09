require 'test_helper'

class ProductcartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productcarts_index_url
    assert_response :success
  end

end
