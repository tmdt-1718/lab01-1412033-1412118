class PhotosController < ApplicationController

  before_action :get_album, only: [:show, :edit, :update, :destroy]

  def index
    @album = Album.limit(10)

  end

  def show
    @album = Album.find(params[:id])
    abc = @album.views += 1
    @album.update_attribute "views", abc

  end

  def edit

  end

  def update
    if @album.update(album_params)
      flash[:success] = "Update album #{@album.id} successfully."
      redirect_to photos_path(@album.id)
    else
      flash[:error] = "Cannot update album #{@album.id}."
      render :show
    end
  end

  def destroy
    begin
      @album.destroy!
      flash[:success] = "Delete album #{@album.id} successfully."
      redirect_to photos_path
    rescue ActiveRecord::RecordNotDestroyed => e
      flash[:error] = "Cannot delete album #{@album.id}."
      render :show
    end
  end


  private
  def get_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:user_id, :cover, :views)
  end
  end
