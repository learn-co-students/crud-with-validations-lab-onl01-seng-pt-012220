class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = set_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(params[:song]))
    if @song.save
      redirect_to songs_path(@song)
    else 
      render :new
    end
  end
  
  def edit
    @song = set_song
  end



  def update
    @song = set_song
    @song.update(song_params(params[:song]))
    if @song.save
      redirect_to songs_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params(*args)
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
