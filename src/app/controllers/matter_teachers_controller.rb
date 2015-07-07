class MatterTeachersController < ApplicationController
  before_action :set_matter_teacher, only: [:show, :edit, :update, :destroy]
  

  
  def index
    @matter_teachers = MatterTeacher.all
  end

  
  def show
  end

  
  def new
        @matter_teacher = MatterTeacher.new
        @matter_teacher.teacher_id=current_teacher.user.id
  end

  
  def edit
  end

  
  def create
    @matter_teacher = MatterTeacher.new(matter_teacher_params)
    

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

  
  def destroy
    @matter_teacher.destroy
    respond_to do |format|
      format.html { redirect_to matter_teachers_url, notice: 'Matter teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_matter_teacher
      @matter_teacher = MatterTeacher.find(params[:id])
    end
  
    def matter_teacher_params
      params.require(:matter_teacher).permit(:matter_id, :teacher_id, :value)
    end
end