class EnrollsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_enroll, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /enrolls
  # GET /enrolls.json
  def index
    @enrolls = Enroll.all
  end

  # GET /enrolls/1
  # GET /enrolls/1.json
  def show
    @enroll = Enroll.find(params[:id])
  end

  # GET /enrolls/new
  def new
    @user = current_user
    @semester = Semester.find_by_status("Current")
    @maximum_credit =  @semester.maximum_credit.present? ? @semester.maximum_credit : nil
    @courses =  Course.where("semester = ?", @semester.sem_name)
    @enroll = Enroll.new(user_id: @user.id, semester_id: @semester.id)
    @courses.each do |course|
      @enroll.registers.new(course_id: course.id)
    end
  end

  # GET /enrolls/1/edit
  def edit
    @user = current_user
    @semester = Semester.find_by_status("Current")
    @maximum_credit = @semester.maximum_credit
    @courses =  Course.where("semester = ?", @semester.sem_name)
  end

  # POST /enrolls
  # POST /enrolls.json
  def create
    @enroll = Enroll.new(enroll_params)

    # params[:enroll][:course_ids].each do |c_id|
    #   @enroll.registers.new(course_id: c_id) if c_id.present?
    # end

    respond_to do |format|
      if @enroll.save
        # params[:course_attributes].each do |course|
        #   @enroll.registers.create(course_id: course['course_id'], enroll_id: @enroll.id)
        # end
        format.html { redirect_to @enroll, notice: 'Enroll was successfully created.' }
        format.js { }
        format.json { render :show, status: :created, location: @enroll }
      else
        @user = current_user
        @semester = Semester.find_by_status("Current")
        @courses =  Course.where("semester = ?", @semester.sem_name)
        @courses.each do |course|
          @enroll.registers.new(course_id: course.id)
        end
        format.html { render :edit }
        format.json { render new_enroll_path @enroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolls/1
  # PATCH/PUT /enrolls/1.json
  def update
    @user = current_user
    @semester = Semester.find_by_status("Current")
    @maximum_credit = @semester.maximum_credit
    @courses =  Course.where("semester = ?", @semester.sem_name)
    respond_to do |format|
      if @enroll.update(enroll_params)
        format.html { redirect_to @enroll, notice: 'Enroll was successfully updated.' }
        format.json { render :show, status: :ok, location: @enroll }
      else
        format.html { render :edit }
        format.json { render json: @enroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolls/1
  # DELETE /enrolls/1.json
  def destroy
    @enroll.destroy
    respond_to do |format|
      format.html { redirect_to enrolls_url, notice: 'Enroll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enroll
      @enroll = Enroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enroll_params
      #params.require(:enroll).permit(:user_id, :course_id, :semester_id, :user_attributes, :semester_attributes,  registers_attributes: [course_attributes:[]])
      params.require(:enroll).permit(:user_id, :semester_id, :status, course_ids:[])
    end
end
