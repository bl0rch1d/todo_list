class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.where(user_id: current_user.id)

    render :index
  end

  def new
    @project = Project.new

    render :new
  end

  def create
    @project = Project.new
    @project.title = project_params[:title]
    @project.user_id = current_user.id

    if @project.save
      redirect_to root_url
    else
      flash[:error] = @project.errors.full_messages
      render :new
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])

    flash[:error] = @project.errors.full_messages unless @project.destroy

    redirect_to root_url
  end

  def edit
    @project = current_user.projects.find(params[:id])

    render :edit
  end

  def update
    @project = current_user.projects.find(params[:id])
    @project.title = project_params[:title]

    if @project.save
      redirect_to root_url
    else
      flash[:error] = @project.errors.full_messages
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
