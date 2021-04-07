class CommentsController < ApplicationController
  before_action :find_task, only: [:create, :edit, :update, :destroy]
  before_action :find_comment, only: [:edit, :update, :destroy]
  def create
    @comment = @task.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to task_path(@task)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to task_path(@task)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_task
    @task = Task.find(params[:task_id])
  end

  def find_comment
    @comment = @task.comments.find(params[:id])
  end
end
