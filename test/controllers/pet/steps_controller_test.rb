require "test_helper"

class Pet::StepsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pet_steps_show_url
    assert_response :success
  end

  test "should get update" do
    get pet_steps_update_url
    assert_response :success
  end
end
