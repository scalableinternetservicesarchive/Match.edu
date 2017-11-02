require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "password should be present (nonblank)" do
      @student.password = @student.password_confirmation = " " * 6
    assert_not @user.valid?
  end

 
end
