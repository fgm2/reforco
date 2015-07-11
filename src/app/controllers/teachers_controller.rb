class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :find_teacher, only: [:show, :edit, :update, :destroy]

 
  def index
    
    if (params[:materia]) && (params[:materia][:id])
      
        materia_id = params[:materia][:id] if  !params[:materia][:id].nil?
        @teachers  = Teacher.joins('LEFT OUTER JOIN courses ON teachers.id = courses.teacher_id').where("courses.id IN (?)", 
              Course.where("matter_id =  ?",materia_id).select(:id))
    end
    if (params[:area]) && (params[:area][:id])
      area_id = params[:area][:id] if !params[:area][:id].nil?
        @areas = AreaOfKnowledge.joins(' JOIN matters ON area_of_knowledges.id = matters.areaOfKnowledge_id').distinct
        @materias = Matter.where("matters.areaOfKnowledge_id = ? ", area_id )
        @teachers  = Teacher.joins('LEFT OUTER JOIN courses ON teachers.id = courses.teacher_id').where("courses.id IN (?)", 
              Course.where("matter_id IN (?) ", Matter.where("matters.areaOfKnowledge_id = ? ", area_id).select(:id) ).select(:id))
    end
      
      @teachers ||= Teacher.all
      @areas ||= AreaOfKnowledge.joins(' JOIN matters ON area_of_knowledges.id = matters.areaOfKnowledge_id').distinct
      @materias ||= Matter.all
    
    
  end

 
  def show

    @aulas = Course.where( "teacher_id = ? ", @teacher.id)
    
    @aulas_realizadas = MatterTeacherStudent.where("course_id in ( ? )", @aulas.select { |aula| aula.id} )
   
    @horas_aulas = 0
    @aulas_realizadas.each do |aula|
      @horas_aulas = @horas_aulas + aula.hours 
		end
   
  end

 
  def new
    
    @create = true   
    id = current_user.id
    @all_teacher = Teacher.all
    @all_teacher.each do |t|
      if t.user.id.to_s == id.to_s
        @create = false
        @t_id = t.id
        redirect_to controller:'teachers', action: 'show', id: @t_id
      end
    end
    if @create == true
      #redirect_to teachers_path
      @teacher = current_user.teachers.build
      @teacher.user_id = current_user.id
      
    end
    
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