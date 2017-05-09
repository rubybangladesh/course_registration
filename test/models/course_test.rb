require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  fixtures :courses
  # test "the truth" do
  #   assert true
  # end

  test "course attributes must not be empty" do
    course = Course.new
    assert course.invalid?
    # assert course.errors[:course_no].any?
    # assert course.errors[:course_title].any?
    # assert course.errors[:credit].any?
    # assert course.errors[:semester].any?
  end

  test "course credit must be positive" do
    course = Course.new(course_no: "CSE 3107",
                        course_title: "Database",
                        semester: "Fall'16")
    course.credit = -1
    assert course.invalid?

    course.credit = 0
    assert course.invalid?
  end

  test "course is not valid without a unique course no" do
    course = Course.new(course_title: "xyz",
                        course_no: courses(:course_one).course_no,
                        semester: "Fall'16",
                        credit:       3.00)

    assert course.invalid?
    #assert_equal ["has already been taken"], course.errors[:course_title]
  end

  test 'course_title_with_credit' do
    course = courses(:course_one)
    assert_equal(course.send(:course_title_with_credit), 'Theory of Computation 2.0')

  end




end
