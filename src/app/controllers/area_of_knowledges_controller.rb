class AreaOfKnowledgesController < ApplicationController
  before_action :set_area_of_knowledge, only: [:show, :edit, :update, :destroy]

  # GET /area_of_knowledges
  # GET /area_of_knowledges.json
  def index
    @area_of_knowledges = AreaOfKnowledge.all
  end

  # GET /area_of_knowledges/1
  # GET /area_of_knowledges/1.json
  def show
  end

  # GET /area_of_knowledges/new
  def new
    @area_of_knowledge = AreaOfKnowledge.new
  end

  # GET /area_of_knowledges/1/edit
  def edit
  end

  # POST /area_of_knowledges
  # POST /area_of_knowledges.json
  def create
    @area_of_knowledge = AreaOfKnowledge.new(area_of_knowledge_params)

    respond_to do |format|
      if @area_of_knowledge.save
        format.html { redirect_to @area_of_knowledge, notice: 'Area of knowledge was successfully created.' }
        format.json { render :show, status: :created, location: @area_of_knowledge }
      else
        format.html { render :new }
        format.json { render json: @area_of_knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_of_knowledges/1
  # PATCH/PUT /area_of_knowledges/1.json
  def update
    respond_to do |format|
      if @area_of_knowledge.update(area_of_knowledge_params)
        format.html { redirect_to @area_of_knowledge, notice: 'Area of knowledge was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_of_knowledge }
      else
        format.html { render :edit }
        format.json { render json: @area_of_knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_of_knowledges/1
  # DELETE /area_of_knowledges/1.json
  def destroy
    @area_of_knowledge.destroy
    respond_to do |format|
      format.html { redirect_to area_of_knowledges_url, notice: 'Area of knowledge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_of_knowledge
      @area_of_knowledge = AreaOfKnowledge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_of_knowledge_params
      params.require(:area_of_knowledge).permit(:name, :created_at)
    end
end
