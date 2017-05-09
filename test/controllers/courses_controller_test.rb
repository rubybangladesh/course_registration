require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  # fixtures :courses
  setup do
    @course = courses(:course_three)
    @update = {
        course_no:    'CSE 3108',
        course_title: 'Database Lab',
        credit:       '-1.50',
        semester:     'Fall16'
    }
    @failed =  {course_no: 'CSE 1200', course_title: 'OOP', credit: 2.00, semester: 'Fall15'}
    @user = users(:user_one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    #assert_not_nil assigns(:courses)

  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: {course_no: 'CSE 2200', course_title: 'Internet Programming', credit: 2.00, semester: 'Fall16'}
    end
    assert_redirected_to courses_path
  end

  test "fails create course" do
    assert_no_difference('Course.count') do
      post :create, course: {course_no: courses(:course_one).course_no, course_title: 'Internet Programming Course', credit: 2.00, semester: 'Fall16'}
    end
    assert_template "new"
    #assert_redirected_to new_course_path
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    patch :update, id: @course, course: @update
    assert_redirected_to courses_path
  end

  test "fails update course" do
  #  post :create, course: @course
    puts @update.inspect
    patch :update, id: @course, course: @update
    assert_template "edit"
    #assert_redirected_to courses_path(assign(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
