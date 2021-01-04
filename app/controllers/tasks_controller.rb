class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show]
  
  def index
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:succes] = 'Task登録完了'
      redirect_to root_url
    else
    @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    flash.now[:danger] = 'Task投稿失敗'
    render :new
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      unless @task
        redirect_to root_url
      end
    end
end