class CommentsController < ApplicationController
  before_action :set_blog
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @blog.comments.build(comment_params)
    @comment.user = current_user

    authorize @comment

    if @comment.save
      redirect_to @blog, notice: "Comment added"
    else
      redirect_to @blog, alert: "Unable to add comment"
    end
  end

  def edit
    authorize @comment
  end

  def update
    authorize @comment

    if @comment.update(comment_params)
      redirect_to @blog, notice: "Comment updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @comment
    @comment.destroy
    redirect_to @blog, notice: "Comment deleted"
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_comment
    @comment = @blog.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
