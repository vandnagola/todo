class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy update_progress mark_as_done]

  def index
    @tasks = Task.order(priority: :asc, due_date: :asc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      @task.tags << Tag.where(id: params[:task][:tag_ids]) if params[:task][:tag_ids]
      redirect_to tasks_path, notice: 'Task created successfully!'
    else
      render :new
    end
  end

  def edit
   
  end

  def update
    if @task.update(task_params)
      @task.tags = Tag.where(id: params[:task][:tag_ids]) if params[:task][:tag_ids]
      redirect_to tasks_path, notice: 'Task updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task deleted successfully!'
  end

  def update_progress
    @task.update(progress: params[:progress])
    redirect_to tasks_path, notice: 'Task progress updated!'
  end

  def mark_as_done
    @task.update(status: 'completed', progress: 100)
    redirect_to tasks_path, notice: 'Task marked as done!'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority, :status, :progress, :user_email)
  end
end
