require 'test_helper'

class Public::AdressControllerTest < ActionDispatch::IntegrationTest
  test "should get index,edit,create,update,destroy" do
    get public_adress_index,edit,create,update,destroy_url
    assert_response :success
  end

end
