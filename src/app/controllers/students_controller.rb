class StudentsController < ApplicationController
  #before_action :find_student, only: [:edit, :update, :destroy]
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    # @student = current_user.students.build
    # @student.user_id = current_user.id
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    # @student =current_user.students.build(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    
    goback = params[:student][:redirect]
    
    respond_to do |format|
      if @student.update(student_params)
        if goback == "meuperfil"
          format.html { redirect_to "/meuperfil", notice: 'Aluno atualizado com sucesso!' }
        else
          format.html { redirect_to @student, notice: 'Aluno atualizado com sucesso!' }
          format.json { render :show, status: :ok, location: @student }
        end
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:formation, :description)
    end
    private
    # acrtion em caso de se cadastrar mais de uma vez como studante
    #def find_student
      #@student.user_id = current_user.id
      #if @student != params[:id]
       # redirect_to students_path(params[:id]), notice: 'Some message about not having access to perform that action'
      #end
    #end
end
