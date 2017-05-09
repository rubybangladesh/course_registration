class CoursesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_admin, only: [:new, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @current_semester = Semester.find_by(status: 'Current')
    completed_semesters = Semester.where(status: 'Done')
    upcoming_semesters = Semester.where(status: 'Due')

    @current = Course.where(semester: @current_semester.sem_name)
    @completed = Course.where(semester: completed_semesters.pluck(:sem_name))
    @upcoming = Course.where(semester: upcoming_semesters.pluck(:sem_name))
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
    if @course.save
      #redirect_to courses_path
      format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
      format.json { render :show, status: :created, location: @course }
    else
      format.html { render :new }
      format.json { render json: @course.errors, status: :unprocessable_entity }
    end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    #params.fetch(:course, {})
    params.require(:course).permit(:course_no, :course_title, :credit, :semester)
  end
end
