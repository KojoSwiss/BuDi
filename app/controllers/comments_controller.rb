class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create(comment_params)
    @comment.user_id = current_user.user_id

    if @comment.save
      redirect_to_task(@task)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:content).permit(:content)
  end
end
