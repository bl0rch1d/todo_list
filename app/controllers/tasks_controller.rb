class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @task = current_user.projects.includes(:tasks).find(params[:project_id]).tasks.new
    
    render :new
  end

  def create
    @task = current_user.projects.includes(:tasks).find(params[:project_id]).tasks.new

    @task.name = task_params[:name]
    @task.project_id = params[:project_id]

    if @task.save
      redirect_to root_url
    else
      flash[:error] = @task.errors.full_messages
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])

    render :edit
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.name = task_params[:name]

    if @task.save
      redirect_to root_url
    else
      flash[:error] = @task.errors.full_messages
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])

    flash[:error] = @task.errors.full_messages unless @task.destroy

    redirect_to root_url
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
