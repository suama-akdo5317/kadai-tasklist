class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    if logged_in?
      @task = current_user.tasks.build  # form_with 用
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:succes] = 'タスク登録完了'
      redirect_to root_url
    else
    @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    flash.now[:danger] = 'タスク投稿失敗'
    render 'tasks/index'
    end
  end

  def edit
  end

  def update
    @task= current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'タスク投稿失敗'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:succes] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status, :task)
  end
end