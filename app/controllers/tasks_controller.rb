class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to(task)
    else
      flash["There was an error creating the task!"]
    end
  end

  def show
    id = params[:id]
    @task = Task.find(id)
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :description)
  end
end
