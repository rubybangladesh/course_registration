require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  fixtures :semesters
  setup do
    @new = {
        sem_name: 'Summer17',
        status: 'Current',
        maximum_credit: '5.00'
    }
  end
  # test "the truth" do
  #   assert true
  # end

  test "semester attributes must not be empty" do
    semester = Semester.new
    assert semester.invalid?
    # assert semester.errors[:sem_name].any?
    # assert semester.errors[:status].any?
    # assert semester.errors[:maximum_credit].any?
  end

  test "maximum credit must be positive" do
    semester = Semester.new(sem_name: "Fall'17",
                            status: "Due")
    # semester.maximum_credit = -1
    # assert semester.invalid?
    #
    # semester.maximum_credit = 0
    # assert semester.invalid?

    semester.maximum_credit = 5.00
    assert semester.valid?
  end

  test "semester is not valid without a unique title" do
    semester = Semester.new(sem_name: semesters(:semester_two).sem_name,
                            status: "Done",
                            maximum_credit: 5.00)

    assert semester.invalid?
  end

  test 'only one semester is current' do
    semester = Semester.where(status: 'Current').count
    assert_equal(1, semester)
  end


end
