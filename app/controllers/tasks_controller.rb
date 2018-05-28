class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'Taskが正常に登録されました'
      redirect_to @task
    else
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'Taskが登録されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Taskが正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが登録されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong parameter
  def task_params
    params.require(:task).permit(:content, :status, :user_id)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
      flash[:danger] = '自分以外のTaskは操作できません'
    end
  end
end