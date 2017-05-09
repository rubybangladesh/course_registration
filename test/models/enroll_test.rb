require 'test_helper'

class EnrollTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'semester already exists' do
    enroll = enrolls(:enroll_one)
    assert_equal(enroll.send(:semester_check), 'Already Registered!!')
  end

  test 'credit must not exceed' do
    enroll = enrolls(:enroll_one)
    assert_equal(enroll.send(:semester_check), 'Maximum Credit Exceeded!!')
  end
end
