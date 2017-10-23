require 'test_helper'

class ProfessorControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_professor_url
    assert_response :success
  end

end
