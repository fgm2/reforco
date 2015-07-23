class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :find_teacher, only: [:show, :edit, :update, :destroy]

 
  def index
    
   
    if ( (params[:area]) and (!params[:area][:id].eql? "") )
      area_id = params[:area][:id] 
        # @areas = AreaOfKnowledge.joins(' JOIN matters ON area_of_knowledges.id = matters.areaOfKnowledge_id').distinct
        @materias = Matter.where("matters.areaOfKnowledge_id = ? ", area_id )
        @teachers  = Teacher.joins('LEFT OUTER JOIN courses ON teachers.id = courses.teacher_id').
              where("courses.id IN (?)", 
                Course.where("matter_id IN (?) ", 
                  Matter.where("matters.areaOfKnowledge_id = ? ", 
                    area_id).select(:id) ).select(:id)).distinct
    end

    
    if (params[:materia]) and (!params[:materia][:id].eql? "")
      
        materia_id = params[:materia][:id] 
        @teachers  = Teacher.joins('LEFT OUTER JOIN courses ON teachers.id = courses.teacher_id').
              where("courses.id IN (?)", 
              Course.where("matter_id =  ?",materia_id).select(:id)).distinct
    end
      
      @teachers ||= Teacher.all
      @areas ||= AreaOfKnowledge.joins(' JOIN matters ON area_of_knowledges.id = matters.areaOfKnowledge_id').distinct
      @materias ||= Matter.all
      
      @cursos ||= Course.all
      @matriculas ||= Enrollment.all
      @recomendacoes ||= Recommendation.all
    
    
  end

 
  def show

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

 
  def new
    @teacher = Teacher.all
    if ( @teacher.find_by( user_id: current_user.id ) )
       flash[:notice] = "Olá #{current_user.name}, Você já é um professor!"
       redirect_to teacher_path(@teacher.find_by(user_id: current_user.id))
    else
      @teacher = Teacher.new
      @teacher.user = User.find(current_user.id)
    end  
    
    # @create = true   
    # id = current_user.id
    # @all_teacher = Teacher.all
    # @all_teacher.each do |t|
    #   if t.user.id.to_s == id.to_s
    #     @create = false
    #     @t_id = t.id
    #     redirect_to controller:'teachers', action: 'show', id: @t_id
    #   end
    # end
    # if @create == true
    #   #redirect_to teachers_path
    #   @teacher = current_user.teachers.build
    #   @teacher.user_id = current_user.id
      
    # end
    
  end

 
  def edit
  end

  
  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = User.find(current_user.id)
    
    # @teacher.user.avatar = Paperclip::Attachment.new(params[:teacher][:avatar], p, p.class.attachment_definitions[attach_name.to_suym])
    
    # user = { 
    #     :avatar => params[:teacher][:avatar],
    #     :name => params[:teacher][:name],
    #     :scholarity => params[:teacher][:scholarity],
    #     :addrress => params[:teacher][:address],
    #     :state => params[:teacher][:state],
    #     :country => params[:teacher][:country],
    #     :date_of_birth => params[:teacher][:date_of_birth],
    #     :cpf => params[:teacher][:cpf],
    #     :fone => params[:teacher][:fone],
    #     :email => params[:teacher][:email],
    #     :whatsapp => params[:teacher][:whatsapp],
    #     :skype => params[:teacher][:skype]
    # }
    
    # @user = User.find(@teacher.user.id)
    # @user.update(user)
    
    # @teacher.user = @user
    
    
    # @teacher.user.avatar = Paperclip(avatar: params[:teacher][:avatar])
    
    # @teacher.user.update_attribute(:avatar,File.open(params[:teacher][:avatar]))
    
    # @teacher.user.avatar.url = params[:teacher][:avatar]
    @teacher.user.name = params[:teacher][:name]
    @teacher.user.scholarity = params[:teacher][:scholarity]
    @teacher.user.addrress = params[:teacher][:address]
    @teacher.user.state = params[:teacher][:state]
    @teacher.user.country = params[:teacher][:country]
    @teacher.user.date_of_birth = params[:teacher][:date_of_birth]
    @teacher.user.cpf = params[:teacher][:cpf]
    @teacher.user.fone = params[:teacher][:fone]
    @teacher.user.email = params[:teacher][:email]
    @teacher.user.whatsapp = params[:teacher][:whatsapp]
    @teacher.user.skype = params[:teacher][:skype]

    respond_to do |format|
      if @teacher.save
        
          @teacher.user.save
        
        format.html { redirect_to @teacher, notice: 'Parabéns! Agora você é um professor.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update

    goback = params[:teacher][:redirect]
    
    respond_to do |format|
      if @teacher.update(teacher_params)
        if goback == "meuperfil"
          format.html { redirect_to "/meuperfil", notice: 'Professor atualizado com sucesso!' }
        else
          format.html { redirect_to @teacher, notice: 'Professor atualizado com sucesso!' }
          format.json { render :show, status: :ok, location: @teacher }
        end
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
      params.require(:teacher).permit(:formation, :university, :description,  courses_attributes: [:id, :name, :_destroy], users_attributes: [:name, :cpf, :scholarity, :fone, :whatsapp, :skype, :addrress, :state, :country, :date_of_birth])
    end
    ## para tomar um action em caso de duplicidades
    #def find_teacher
      #@teacher.user_id = current_user.id
      #if @teacher.user_id != params[:id]
       # redirect_to teachers_path(params[:id]), notice: 'Some message about not having access to perform that action'
      #end
    #end
    
end