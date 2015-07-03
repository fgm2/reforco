class MatterTeacherStudentsController < ApplicationController
  before_action :set_matter_teacher_student, only: [:show, :edit, :update, :destroy]

  # GET /matter_teacher_students
  # GET /matter_teacher_students.json
  def index
    @matter_teacher_students = MatterTeacherStudent.all
  end

  # GET /matter_teacher_students/1
  # GET /matter_teacher_students/1.json
  def show
  end

  # GET /matter_teacher_students/new
  def new
    @matter_teacher_student = MatterTeacherStudent.new
  end

  # GET /matter_teacher_students/1/edit
  def edit
  end

  # POST /matter_teacher_students
  # POST /matter_teacher_students.json
  def create
    @matter_teacher_student = MatterTeacherStudent.new(matter_teacher_student_params)

    respond_to do |format|
      if @matter_teacher_student.save
        format.html { redirect_to @matter_teacher_student, notice: 'Matter teacher student was successfully created.' }
        format.json { render :show, status: :created, location: @matter_teacher_student }
      else
        format.html { render :new }
        format.json { render json: @matter_teacher_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matter_teacher_students/1
  # PATCH/PUT /matter_teacher_students/1.json
  def update
    respond_to do |format|
      if @matter_teacher_student.update(matter_teacher_student_params)
        format.html { redirect_to @matter_teacher_student, notice: 'Matter teacher student was successfully updated.' }
        format.json { render :show, status: :ok, location: @matter_teacher_student }
      else
        format.html { render :edit }
        format.json { render json: @matter_teacher_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matter_teacher_students/1
  # DELETE /matter_teacher_students/1.json
  def destroy
    @matter_teacher_student.destroy
    respond_to do |format|
      format.html { redirect_to matter_teacher_students_url, notice: 'Matter teacher student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matter_teacher_student
      @matter_teacher_student = MatterTeacherStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matter_teacher_student_params
      params.require(:matter_teacher_student).permit(:matter_id, :teacher_id, :student_id, :many)
    end
end
