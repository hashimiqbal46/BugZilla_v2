class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy,:assign_user,:bug_resolve]
  #before_action :set_project, all:

  # GET /bugs
  # GET /bugs.json
  def index
    @bugs = Project.find(params[:project_id]).bugs.all
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
    authorize @bug
  end

  # GET /bugs/new
  def new
    @bug = Project.find(params[:project_id]).bugs.new
  end

  # GET /bugs/1/edit
  def edit
    authorize @bug
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @bug = Project.find(params[:project_id]).bugs.new(bug_params)
    @bug.user_id = current_user.id
    @bug.status = "new"
    authorize @bug
    if @bug.save
      redirect_to project_path(@bug.project.id), notice: 'Bug was successfully created.'
        
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
    authorize @bug
    @bug.destroy
    redirect_to projects_path, notice: 'Bug was successfully destroyed.'
  end


  def assign_user
    authorize @bug
    @bug.update(Assigned: current_user.id, status: 'started')
    redirect_to project_path(@bug.project.id)
  end

  def bug_resolve
    authorize @bug
    if @bug.bug_type == 'bug'
      @bug.update(status: "Resolved")
    else
      @bug.update(status: "Completed")
    end
    redirect_to projects_path
  end



  private

    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Project.find(params[:project_id]).bugs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through

    def bug_params
      params.require(:bug).permit(:title,:deadline,:type,:status,:user_id,:project_id,:bug_type,:image,:Description)
    end
end
