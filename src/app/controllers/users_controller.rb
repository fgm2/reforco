class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :require_admin, except: [:show, :edit, :update, :meuperfil]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
  
  def meuperfil
    
    @user = current_user
    
    if is_student(current_user.id) 
      @student = getStudent(current_user.id)
      @matriculas_student = Enrollment.where( "student_id = ? ", @student.id)
      @matriculas_student.each do |aula_student|
        @aulas_student = aula_student.course.name 
      end
    end
    
    if is_teacher(current_user.id) 
      @teacher = getTeacher(current_user.id)
      @aulas = Course.where( "teacher_id = ? ", @teacher.id)
      @ultimas_aulas = Enrollment.where("course_id in ( ? )", @aulas.select(:id) ).limit(5)
      @aulas_realizadas = Enrollment.where("id NOT IN ( ? ) AND course_id in ( ? )", @ultimas_aulas.select(:id),@aulas.select(:id) )
      @minhas_aulas = Enrollment.where("course_id in ( ? )", @aulas.select(:id) )
     
      @horas_aulas = 0
      @minhas_aulas.each do |aula|
        @horas_aulas = @horas_aulas + aula.hours 
      end
      @cursos ||= Course.all
      @matriculas ||= Enrollment.all
      @recomendacoes ||= Recommendation.all
  		
  		@positivas = @recomendacoes.where("rating = 1 AND enrollment_id IN (?) ",
                                              @matriculas.where("course_id IN (?)",
                                                @cursos.where("teacher_id = ? ", @teacher.id).select(:id)
                                                    ).select(:id) 
                                                      ).count
  		
  		@negativas = @recomendacoes.where("rating = 0 AND enrollment_id IN (?) ",
                                              @matriculas.where("course_id IN (?)",
                                                @cursos.where("teacher_id = ? ",@teacher.id).select(:id)
                                                ).select(:id)).count
           
           
      if (@positivas+@negativas > 0)                                           
        @porcentagem = (@positivas*100)/(@positivas+@negativas)
      else
        @porcentagem = 0
      end
    end
    
    
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuário atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :cpf, :scholarity, :fone, :whatsapp, :skype, :addrress, :state, :country, :date_of_birth, :created_at, :avatar)
    end
end