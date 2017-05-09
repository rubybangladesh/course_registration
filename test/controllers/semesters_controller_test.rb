require 'test_helper'

class SemestersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  #fixtures :semesters
  setup do
    @user = users(:user_one)
    sign_in @user

    @semester = semesters(:semester_one)
    @update = {
        sem_name: 'Fall16',
        status: 'Done',
        maximum_credit: 5.00
    }


  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:semesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create semester" do
    assert_difference('Semester.count') do
      post :create, semester: {sem_name: 'Fall16', status: 'Due', maximum_credit: 5.00}
    end

    assert_redirected_to semesters_path
  end

  test "fails create semester" do
    assert_no_difference('Semester.count') do
      post :create, semester: {sem_name: semesters(:semester_one).sem_name, status: 'Due', maximum_credit: 5.00}
    end
    assert_template "new"

    #assert_redirected_to new_semester_path
  end

  test "should show semester" do
    get :show, id: @semester
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @semester
    assert_response :success
  end

  test "should update semester" do
    patch :update, id: @semester, semester: @update
    assert_redirected_to semesters_path
  end

  test "fails update semester" do
    patch :update, id: @semester, semester: {sem_name: 'Fall16', status: 'Due', maximum_credit: '5.00'}
    assert_template "edit"
    assert_redirected_to edit_semester_path
  end

  test "should destroy semester" do
    assert_difference('Semester.count', -1) do
      delete :destroy, id: @semester
    end

    assert_redirected_to semesters_path
  end
end
