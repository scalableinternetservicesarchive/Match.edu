require 'test_helper'

class ProfessorControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get professor_new_url
    assert_response :success
  end

end
