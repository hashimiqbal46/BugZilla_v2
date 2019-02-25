class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  #before_action :set_project, all:

  # GET /bugs
  # GET /bugs.json
  def index
    @bugs = Project.find(params[:project_id]).bugs.all
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
    
  end

  # GET /bugs/new
  def new
    @bug = Project.find(params[:project_id]).bugs.new
  end

  # GET /bugs/1/edit
  def edit
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @bug = Project.find(params[:project_id]).bugs.new(bug_params)

    if @bug.save
      redirect_to projects_path, notice: 'Bug was successfully created.'
        
    else
      render 'new'
    end
  end

  # PATCH/PUT /bugs/1
  # PATCH/PUT /bugs/1.json
  def update
    if @bug.update(bug_params)
      redirect_to projects_path, notice: 'Bug was successfully updated.' 
    else
      render :edit 
    end
    
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
    @bug.destroy
    redirect_to projects_path, notice: 'Bug was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Project.find(params[:project_id]).bugs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bug_params
      params.require(:bug).permit(:title,:deadline,:type,:status,:user_id,:project_id,:bug_type)
    end
end
