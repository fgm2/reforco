class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :find_teacher, only: [:show, :edit, :update, :destroy]

 
  def index
    @teachers = Teacher.all
  end

 
  def show
  end

 
  def new
    @teacher = current_user.teachers.build
    @teacher.user_id = current_user.id

  end

 
  def edit
  end

  
  def create
    @teacher = current_user.teachers.build(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit(:formation, :description, courses_attributes: [:id, :name, :_destroy])
    end
    ## para tomar um action em caso de duplicidades
    #def find_teacher
      #@teacher.user_id = current_user.id
      #if @teacher.user_id != params[:id]
       # redirect_to teachers_path(params[:id]), notice: 'Some message about not having access to perform that action'
      #end
    #end
    
end