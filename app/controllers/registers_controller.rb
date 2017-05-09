class RegistersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_register, only: [:show, :edit, :update, :destroy]

  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all

    @current_semester = Semester.find_by_status("Current")
    @completed_semesters = Semester.find_by_status("Done")
    @upcoming_semesters = Semester.find_by_status("Due")
    @current_enroll_id = @current_semester.enrolls.ids
    @completed_enroll_ids = @completed_semesters.enrolls.ids
    @upcoming_enroll_ids = @upcoming_semesters.enrolls.ids
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(register_params)

    respond_to do |format|
      if @register.save
        format.html { redirect_to @register, notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: @register }
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to registers_url, notice: 'Register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:enroll, :course_id)
    end
end
