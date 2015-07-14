class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    
    @destaques =  Course.order("RANDOM()").limit(4).distinct
    @courses = Course.where("id NOT IN (?) ", @destaques.select(:id).distinct)
    
    if ( (user_signed_in?) and (is_student(current_user.id)) )
    # if @aluno.valid?
      @aluno = Student.where("user_id = ? ",current_user.id).first
      @suas_aulas = Enrollment.where("student_id = ? ", @aluno.id )
      @recomendacoes = Recommendation.where("enrollment_id IN (?)", @suas_aulas.select(:id))
      
    else
      @suas_aulas = nil
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @alunos = Student.joins("JOIN enrollments ON students.id = enrollments.student_id ").
                      where("enrollments.course_id = ?", @course.id)
                      
                      
                      
                      
    @cursos ||= Course.all
    @matriculas ||= Enrollment.all
    @recomendacoes ||= Recommendation.all
		
		@positivas = @recomendacoes.where("rating = 1 AND enrollment_id IN (?) ",
                                            @matriculas.where("course_id = (?)",
                                              @course.id).select(:id)).count
		
		@negativas = @recomendacoes.where("rating = 0 AND enrollment_id IN (?) ",
                                            @matriculas.where("course_id IN (?)",
                                             @course.id).select(:id)).count
                                                    
    @porcentagem = (@positivas*100)/(@positivas+@negativas)                  
    
                      
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
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
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
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
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
  
  
  # GET /courses/agendamento/:course_id
  def agendamento
    @curso = Course.find(params[:course_id])
    @prof = @curso.teacher
    if (user_signed_in?)
      @aluno = Student.where("user_id = ? ", current_user.id)
    else
      @aluno = nil
    end
    # render "courses/agendamento"
  end
  
  # POST /courses/agendamento/
  def agendamento_save

    horas = params[:duracao]
    @user = User.find(params[:user_id])
    @aluno = Student.where("user_id = ?", @user.id).first
    @curso = Course.find(params[:id_curso])
    
    # @agendamento = MatterTeacherStudent.new
    @agendamento = Enrollment.new
    @agendamento.course_id = @curso.id
    @agendamento.student_id = @aluno.id
    @agendamento.hours = horas
    
    
    if @agendamento.save
      redirect_to action: 'index', notice: 'Agendamento criado com sucesso.'
    else
      redirect_to  action: 'index', notice: 'Erro na criação do agendamento'
    end
      
  end
  
  
  def recomendacao
    
    if ( (user_signed_in?) and (is_student(current_user.id)) )
      @aluno = Student.where("user_id = ? ",current_user.id).first
      @recomendacoes = Recommendation.all
      @matriculas = Enrollment.where("student_id = ?", @aluno.id)
                  
    end
    
  end
  
  # POST /courses/agendamento/recomendacao
  def recomendacao_save
    
    avaliacao = params[:avaliacao]
    comentario = params[:comentario]
    user_id = params[:user_id]
    course_id = params[:course_id]
    
    @user = User.find(user_id)
    @aluno = Student.where("user_id = ?", @user.id).first
    @curso = Course.find(course_id)
    
    @matricula = Enrollment.where("course_id = ? ", @curso.id ).
                            where("student_id = ?", @aluno.id).
                            where("evaluation IS NULL ").first
    
    
    @recomendacao = Recommendation.new
    @recomendacao.rating = avaliacao
    @recomendacao.description = comentario
    @recomendacao.enrollment_id = @matricula.id
    @recomendacao.course_date = @matricula.created_at
    
    
    if @recomendacao.save
      if @matricula.update( evaluation: true )
          redirect_to action: 'index', notice: 'Recomendação salva.'
      else
          redirect_to action: 'index', notice: 'Erro ao atualizar o matricula.'
      end
      # redirect_to action: 'index', notice: 'Agendamento criado com sucesso.'
    else
      redirect_to  action: 'index', notice: 'Erro ao salvar a Recomendacao.'
    end
    
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params[:course]
    end
end
