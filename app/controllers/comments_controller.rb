class CommentsController < ApplicationController

  def index
    @comments = Blog.find_by(id: params[:article_id]).comments

  end
end
