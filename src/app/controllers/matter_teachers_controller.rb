class MatterTeachersController < ApplicationController
  before_action :set_matter_teacher, only: [:show, :edit, :update, :destroy]
  #before_action :set_teacher
  #before_action authenticate_user!
  

  # GET /matter_teachers
  # GET /matter_teachers.json
  def index
    @matter_teachers = MatterTeacher.all
  end

  # GET /matter_teachers/1
  # GET /matter_teachers/1.json
  def show
  end

  # GET /matter_teachers/new
  def new
    @matter_teacher = MatterTeacher.new
  end

  # GET /matter_teachers/1/edit
  def edit
  end

  # POST /matter_teachers
  # POST /matter_teachers.json
  def create
    @matter_teacher = MatterTeacher.new(matter_teacher_params)
    #@teacher.user_id =current_user.id
    #@matter_teacher.teacher_id = @teacher.id

    respond_to do |format|
      if @matter_teacher.save
        format.html { redirect_to @matter_teacher, notice: 'Matter teacher was successfully created.' }
        format.json { render :show, status: :created, location: @matter_teacher }
      else
        format.html { render :new }
        format.json { render json: @matter_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matter_teachers/1
  # PATCH/PUT /matter_teachers/1.json
  def update
    respond_to do |format|
      if @matter_teacher.update(matter_teacher_params)
        format.html { redirect_to @matter_teacher, notice: 'Matter teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @matter_teacher }
      else
        format.html { render :edit }
        format.json { render json: @matter_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matter_teachers/1
  # DELETE /matter_teachers/1.json
  def destroy
    @matter_teacher.destroy
    respond_to do |format|
      format.html { redirect_to matter_teachers_url, notice: 'Matter teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matter_teacher
      @matter_teacher = MatterTeacher.find(params[:id])
    end
    #def set_teacher
      #@teacher=Teacher.find(params[teacher:id])
   # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matter_teacher_params
      params.require(:matter_teacher).permit(:matter_id, :teacher_id, :value)
    end
end
