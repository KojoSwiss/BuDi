class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    # if params[:category].blank?
    #   @tasks = Task.all.order('created_at DESC')
    # else
    #   @category_id = Category.find_by(name: params[:category]).id
    #   @tasks = Task.where(category_id: @category_id).order('created_at DESC')
    # end

    # PG Search
    if params[:query].present?
      @tasks = Task.search_by_title_and_description(params[:query])
    elsif params[:category].blank?
      @tasks = Task.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @tasks = Task.where(category_id: @category_id).order('created_at DESC')
    end
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(tasks_params)
    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(tasks_params)
      redirect_to task_path(@task)
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def contact
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :description, :company, :url, :category_id, :location)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
