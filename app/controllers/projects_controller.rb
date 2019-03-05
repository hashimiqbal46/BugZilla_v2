class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy,:project_users,:project_add_user,:project_remove_user]
  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = current_user.projects.new
    authorize @project
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    current_user.projects << @project
    authorize @project
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit 
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  def project_users
    @Accepts_users = @project.users.all
    @reject = User.all - @Accepts_users
  end

  def project_add_user
    @user = User.find(params[:user])
    @user.projects   << @project
    redirect_to project_users_project_path(@project), notice: 'User has been assigned to this project'
  end

  def project_remove_user
    @user = User.find(params[:user])
    @user.projects.delete(@project)
    redirect_to project_users_project_path(@project), notice: 'User has been removed from this project'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_authorize
      authorize @project
    end
    
    def set_project
      @project = current_user.projects.find(params[:id])
      set_authorize
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :content)
    end
end
