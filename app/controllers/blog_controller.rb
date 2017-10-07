class BlogController < ApplicationController
  before_action :authenticate
  before_action :get_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blog = Blog.limit(10)
  end

  def show
    @blog = Blog.find(params[:id])
    abc = @blog.view += 1
    @blog.update_attribute "view", abc
    
  end

  def edit

  end

  def update


    if @blog.update(blog_params)
      flash[:success] = "Update blog #{@blog.id} successfully."
      redirect_to blog_path(@blog.id)
    else
      flash[:error] = "Cannot update blog #{@blog.id}."
      render :show
    end



  end

  def destroy


    begin
      @blog.destroy!
      flash[:success] = "Delete blog #{@blog.id} successfully."
      redirect_to blog_path
    rescue ActiveRecord::RecordNotDestroyed => e
      flash[:error] = "Cannot delete blog #{@blog.id}."
      render :show
    end
  end



  private
  def get_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:user_id, :avatar, :body, :view, :title)
  end
  end
