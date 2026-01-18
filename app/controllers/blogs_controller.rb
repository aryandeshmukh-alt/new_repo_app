class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :published]
  before_action :authenticate_user!, only: [:drafts]

  before_action :set_blog, only: [:show, :edit, :update, :destroy, :publish]

  def index
    @blogs = policy_scope(Blog)
              .includes(:comments, :user)
              .order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render json: @blogs }
    end
  end

  def show
    authorize @blog if user_signed_in?

    respond_to do |format|
      format.html
      format.json { render json: @blog }
    end
  end

  def published
    @blogs = Blog.published.includes(:comments, :user)
    render :index
  end

  def drafts
    @blogs = current_user.blogs.drafts.includes(:comments, :user).order(created_at: :desc)
    render :index
  end

  def new
    @blog = Blog.new
  end

  def edit
    authorize @blog
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      PublishBlogJob.set(wait: 1.hour).perform_later(@blog.id)
      redirect_to @blog, notice: "Blog created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @blog

    if @blog.update(blog_params)
      redirect_to @blog, notice: "Blog updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @blog
    @blog.destroy
    redirect_to blogs_path, notice: "Blog deleted"
  end

  def publish
    authorize @blog
    PublishBlogService.new(@blog).call
    redirect_to @blog, notice: "Blog published"
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
