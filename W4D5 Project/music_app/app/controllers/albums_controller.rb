class AlbumsController < ApplicationController

  def new
    @album = Album.new
    render :new
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:error] = @album.errors.full_message
    end
  end


  def edit
    @album = Album.find_by(id: params[:id])
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to album_url
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id )
  end
end
